# Self Blog

> A self learning, for fun project

## Requirements

- Python>=3.8

- Node>=10

- Postgresql>=12

## Installation

Copy `.env.example` to `.env`

### Python
- Create virtualenv: `python -m venv venv`
- Activate virtualenv: `source venv/bin/activate`
- Install poetry: `pip install poetry`

## Development
- Run `$ docker-compose -f docker-compose.dev.yaml up` to set up dev environment
- Set `STATIC_ROOT=""` in `.env` for running back end and front end independently
### Back end
```bash
$ python manage.py runserver -p {your-favorite-port}
```
### Front end
```bash
$ cd self_blog/static/self_blog && yarn serve
```
