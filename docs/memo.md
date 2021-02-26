# How to initialized this repository

## poetry

```sh
poetry config --local virtualenvs.in-project true
poetry init
# Would you like to define your main dependencies interactively? (yes/no) no
# Would you like to define your development dependencies interactively? (yes/no) [yes] no
# Do you confirm generation? (yes/no) [yes] 
```

```sh
# add package by poetry
poetry add streamlit watchdog
poetry add --dev pytest flake8 autopep8 isort
```

## pyglance (pyright)

[pyglance](https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance) is as extension for vscodes to help python type checking.

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
