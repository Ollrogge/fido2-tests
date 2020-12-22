# fido2-tests

This is a fork of [fido2-tests](https://github.com/solokeys/fido2-tests).

# Setup

Need python 3.6+.

`make venv` and `source venv/bin/activate`

Or simply `pip3 install --user -r requirements.txt`

# Running the tests

Run all FIDO2, HID tests:

```bash
pytest tests/standard -s
```

Run subset of tests with `-k` flag, example:
```bash
pytest -k "TestMakeCredential" -s
```

Note that in most cases when testing a hardware authenticator, `-s` must be supplied to disable stdin/stdout capturing.  This is so the prompts to power cycle the authenticator can be seen and continued.


