# Purpose

This repository is aimed to provide with Streamlit development environment template in VS Code.
Other IDEs like PyCharm are not supported; this is **fully depending** on Visual Studio Code.

Python is installed by `pyenv` into the project directory and packages are specified by poetry; this means you don't need to worry about inconsistency of developing environment.

For developing, those packages are introduced and see `./vscode/settings.json` for linting and formatting, but you can change them as you like.

- mypy (just installed but type checking is mainly done by pyglance)
- flake8
- autopep8
- isort

## Prerequisite

(Surely) Install [Visual Studio Code](https://code.visualstudio.com/download)

<details markdown="1">
<summary>set <code>pyenv</code></summary>

### On Mac OS

installation

`~/.bashrc` match your situation like `~/.bash_profile`.
If you use zsh, relace `~/.bashrc` with `~/.zshrc`

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
poetry config --local virtualenvs.in-project true
poetry init
# Would you like to define your main dependencies interactively? (yes/no) no
# Would you like to define your development dependencies interactively? (yes/no) [yes] no
# Do you confirm generation? (yes/no) [yes] 
```

```sh
# add package by poetry
# poetry add streamlit watchdog
# poetry add --dev pytest flake8 autopep8 isort

# if you pull this repository, do this
poetry install
```

</details>

## File structures

```sh
.
├── .dockerignore      # for docker
├── .gitignore         # for git
├── .python-version    # specify python version by pyenv
├── .vscode
│   ├── extensions.json # recommendation of extensions
│   └── settings.json # linting and formatting settings
├── Dockerfile         # for docker
├── README.md          # this file
├── docker-compose.yml # for docker
├── poetry.lock        # for poetry
├── pyproject.toml     # for poetry
├── pyrightconfig.json # for VS Code pyright
├── pytest.ini         # for pytest
├── src
│   └── main.py       # entry point for streamlit
└── tests
    ├── __init__.py
    └── test_calc.py   # test example
```

To solve pyhon path for vscode typing check by pyglance (pyright), you need to write this into `./pyrightconfig.json`. See details in https://github.com/microsoft/pyright/blob/master/docs/configuration.md#sample-config-file

```json
{
  "include": [
    "src"
  ],
  "executionEnvironments": [
    {
      "root": "src"
    }
  ]
}
```

## Run streamlit demo

```sh
# only when pulling this repository first time
pyenv install $PY_VERSION # $PY_VERSON=3.8.7 

poetry install # only when package is added or updated
poetry shell
streamlit hello
# See left side bar, select DataFrame demo, then code will be shown in main panel.
```

## Run own code in local

```sh
poetry shell
streamlit run src/main.py 
# access 127.0.0.1:8501
```

## Debug

In vscode, set breakpoint by clicking arbitrary line number, which turn into a red point. Then the left side-bar of vscode, clicke debug icon and select `Python File`, debugging will be started/

## Run in docker

```sh
docker-compose up --build
# access 127.0.0.1:8501
```

## Test

```sh
pytest
```
