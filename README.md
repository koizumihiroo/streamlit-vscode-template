## Prerequisite

<details markdown="1">
<summary>set <code>pyenv</code></summary>

### On Mac OS

installation

`~/.bashrc` match your situation like `~/.bash_profile`.

```sh
PY_VERSION=3.8.7
brew install pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
exec $SHELL -l # reload
pyenv install $PY_VERSION
pyenv local $PY_VERSION
```

### On Ubuntu or other OSs

No documents. You can google it.

</details>

<details markdown="1">
<summary>set <code>poetry</code></summary>

### On Mac OS

installation

```sh
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
```

```sh
poetry config virtualenvs.in-project true
poetry init
# Would you like to define your main dependencies interactively? (yes/no) no
# Would you like to define your development dependencies interactively? (yes/no) [yes] no
# Do you confirm generation? (yes/no) [yes] 
```

```sh
# add package by poetry
poetry add streamlit watchdog
```

</details>

<details markdown="1">
<summary>other setting</summary>

```sh
echo -e ".venv\n__pycache__\n.mypy_cache/\n.git" > .gitignore
echo -e ".venv\n__pycache__\n.mypy_cache/" > .dockerignore
```

</details>

## Run streamlit demo

```sh
poetry install # only when package is added or updated
poetry shell
streamlit hello
# See left side bar, select DataFrame demo, then code will be shown in main panel.
```

## Run own code in local

```sh
poetry shell
streamlit run src/main.py 
```

## Run in docker

```sh
docker-compose build
docker-compose up --build
# access 127.0.0.1:8501
```
