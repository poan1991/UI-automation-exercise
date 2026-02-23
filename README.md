# Installation and execution of tests:

Tests are created using Robot Framework and Browser Library (Playwright engine) 

Only Python 3.7 or newer is supported.
Install node.js e.g. from https://nodejs.org/en/download/

Update pip:
```bash
pip install -U pip
```

Install robotframework-browser:
```bash
pip install robotframework-browser
```

Initialize node dependencies:
```bash
rfbrowser init
# if rfbrowser is not found:
python -m Browser.entry init
```

Execute tests via command line:
```bash
robot --outputdir ./reports --include regression --variable HEADLESS:False tests/test_suite.robot
```