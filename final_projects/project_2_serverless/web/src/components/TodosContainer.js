import React, { Component } from 'react'
import axios from 'axios'
import update from 'immutability-helper'

class TodosContainer extends Component {
	constructor(props) {
    super(props)
    this.state = {
			todos: [],
			inputValue: ''
    }
  }

	getTodos() {
    axios.get('http://localhost:5000/')
    .then(response => {
			console.log(response)
      this.setState({todos: response.data})
    })
    .catch(error => console.log(error))
	}

	createTodo = (e) => {
		if (e.key === 'Enter') {
			axios.post('http://localhost:5000/', {text: e.target.value})
			.then(response => {
				const todos = update(this.state.todos, {
					$splice: [[0, 0, response.data]]
				})
				this.setState({
					todos: todos,
					inputValue: ''
				})
			})
			.catch(error => console.log(error))      
		}    
	}

	updateTodo = (e, id) => {
    axios.put(`http://localhost:5000/${id}/`, {done: e.target.checked})
    .then(response => {
      const todoIndex = this.state.todos.findIndex(x => x.id === response.data.id)
      const todos = update(this.state.todos, {
        [todoIndex]: {$set: response.data}
      })
      this.setState({
        todos: todos,
				inputValue: ''
      })
    })
    .catch(error => console.log(error))      
  }
	
	deleteTodo = (id) => {
    axios.delete(`http://localhost:5000/${id}/`)
    .then(response => {
      const todoIndex = this.state.todos.findIndex(x => x.id === id)
      const todos = update(this.state.todos, {
        $splice: [[todoIndex, 1]]
      })
      this.setState({
        todos: todos
      })
    })
    .catch(error => console.log(error))
	}
	
	componentDidMount() {
    this.getTodos()
	}
	
	handleChange = (e) => {
		this.setState({inputValue: e.target.value});
	}

  render() {
    return (
      <div>
        <div className="inputContainer">
          <input className="taskInput" type="text" 
            placeholder="Add a task" maxLength="50"
            onKeyPress={this.createTodo} onChange={this.handleChange} value={this.state.inputValue} />
        </div>  	    
				<div className="listWrapper">
					<ul className="taskList">
						{this.state.todos.length == 0 ? "No items." : ""}
						{this.state.todos.map((todo) => {
							return(
								<li className="task" todo={todo} key={todo.id}>
									<input className="taskCheckbox" type="checkbox" 
										checked={todo.done}
  									onChange={(e) => this.updateTodo(e, todo.id)}
									/>
									<label className="taskLabel">{todo.text}</label>
									<span className="deleteTaskBtn"
												onClick={(e) => this.deleteTodo(todo.id)}
									>x</span>
								</li>
							)       
						})} 	    
					</ul>
				</div>
     </div>  
    )
  }
}

export default TodosContainer