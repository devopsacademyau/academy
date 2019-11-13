# To do list: Python API and React web app

Simple to do list app with UI in ReactJS and API in Python Flask. 

The user can create, delete, update (mark as item `done`) or delete to do list items.

Data flow:
![](docs/pythonflask.png)

User interface:
![](docs/todo_ss.png)



## Run me

Requirements:
- Python 3
- Yarn
- NodeJS

Run it:
- make prepare
- make run_api
    It will spin up a process listening on port 3000
- make run_web
    It will spin up a process listening on port 5000

### Test

Check the UI on http://localhost:3000/

#### Test API
```buildoutcfg

curl -X GET http://127.0.0.1:5000/
[{"url": "http://127.0.0.1:5000/0/", "text": "do the shopping"}, {"url": "http://127.0.0.1:5000/1/", "text": "build the codez"}, {"url": "http://127.0.0.1:5000/2/", "text": "paint the door"}]

curl -X GET http://127.0.0.1:5000/1/
{"url": "http://127.0.0.1:5000/1/", "text": "build the codez"}

curl -X PUT http://127.0.0.1:5000/1/ -d done=True

curl -X POST http://127.0.0.1:5000/ -d text="flask api is teh awesomez"
```

#### References:
- [Todo list tutorial](https://medium.com/@pamit/todo-list-building-a-react-app-with-rails-api-7a3027907665)

### Improvements

- Create CI/CD 
- Create unit tests and integration tests
- Integrate with real database
- Use 3 muskeeters approach to simplify build and pipelines
- Containerize using Docker
