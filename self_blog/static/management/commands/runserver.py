import atexit
from subprocess import Popen

from django.core.management.commands.runserver import Command as RunServerCommand
from filelock import FileLock, Timeout


class Command(RunServerCommand):
    def handle(self, *args, **options):
        lock = FileLock("front-end.lock")
        try:
            lock.acquire(timeout=1)
            try:
                serve_fe = Popen(["yarn", "serve"], cwd="self_blog/static/self_blog")

                def release():
                    serve_fe.terminate()
                    lock.release()

                atexit.register(release)
            except OSError:
                raise RuntimeError("command 'yarn serve' cannot be run")
        except Timeout:
            print("Another instance of this application currently holds the lock.")
            pass
        super().handle(*args, **options)
