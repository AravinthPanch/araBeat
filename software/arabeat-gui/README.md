# araBeat - Graphical User Interface for ECG optimization


## To Use
```bash
# Install dependencies
npm install

# Run the app
npm start

# Generate standalone package
electron-packager . --icon=assets/icon.icns

# Generate iconset from png
image2icon.app

# Generate icns from iconset
iconutil -c icns "icon.iconset"

# serialport not found in electron issue
./node_modules/.bin/electron-rebuild -$(electron -v)

```
