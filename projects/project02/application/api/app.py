from flask import request, url_for
from flask_api import FlaskAPI, status, exceptions
from flask_cors import CORS, cross_origin

app = FlaskAPI(__name__)
cors = CORS(app, resources={r"/*": {"origins": "*"}})

notes = {
	0: { 'text': 'do the shopping', 'done': False} ,
	1: { 'text': 'build the codez', 'done': False} ,
	2: { 'text': 'paint the door', 'done': False} 
}


def note_repr(key):
	return {
		'url': request.host_url.rstrip('/') + url_for('notes_detail', key=key),
		'text': notes[key]['text'],
		'done': notes[key]['done'],
		'id': key
	}

@app.route("/", methods=['GET', 'POST'])
def notes_list():
	"""
	List or create notes.
	"""
	if request.method == 'POST':
		data = request.data
		
		if notes:
			idx = max(notes.keys()) + 1
		else:
			idx = 1
		
		notes[idx] = {}
		if 'text' in data:
			note = request.data['text']	
			notes[idx]['text'] = note
		if 'done' in data:
			done = request.data['done']	
			notes[idx]['done'] = note
		else:
			notes[idx]['done'] = False
		
		return note_repr(idx), status.HTTP_201_CREATED

	# request.method == 'GET'
	return [note_repr(idx) for idx in sorted(notes.keys())]


@app.route("/<int:key>/", methods=['GET', 'PUT', 'DELETE'])
@cross_origin()
def notes_detail(key):
	"""
	Retrieve, update or delete note instances.
	"""
	if request.method == 'PUT':
		
		data = request.data
		if 'text' in data:
			note = request.data['text']
			notes[key]['text'] = note
		if 'done' in data:
			done = request.data['done']	
			notes[key]['done'] = done

		return note_repr(key), status.HTTP_204_NO_CONTENT

	elif request.method == 'DELETE':
		notes.pop(key, None)
		return '', status.HTTP_204_NO_CONTENT

	# request.method == 'GET'
	if key not in notes:
		raise exceptions.NotFound()
	return note_repr(key)


if __name__ == "__main__":
	app.run(debug=True)
