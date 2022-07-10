import json
from pathlib import Path

movies = [
    {"id": 1, "title": "The Terminator", "year": 1984},
    {"id": 2, "title": "Kindgerten Cop", "year": 1993}
]


data = json.dumps(movies)
print(movies)
print(data)
# Path("movies2.json").write_text(movies)
