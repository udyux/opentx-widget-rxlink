# RxLink

An OpenTX widget intended for the Jumper T16 and Radiomaster TX16S which displays the current RSSI or CRSF LQ state in a color coded format as well as a warning if the SWR/RAS reading indicates an issue with your TX antenna.

## Disclaimer

While this script relies on telemetry, it may not reflect the actual link quality state and should not be used in situations where reliable data is critical. It is the user's responsibility to check for correct operation before use. Please rely on tools supported by your TX/RX manufacturer.

**IF IN DOUBT, DO NOT FLY!**

## Options

| Option    | Description                 |
| --------- | --------------------------- |
| Color     | Normal operation text color |
| NoRxColor | No receiver text color      |
| WarnColor | Low RSSI/LQ text color      |
| CritColor | Critical RSSI/LQ text color |

## Installation

Clone or download this repository and place the `RxLink` folder on your radio's SD card in the `/WIDGETS/` directory.

## Usage

For the time being, this widget is intended to be used with the 8-cell layout (2 columns, 4 rows).

Simply select the widget, select the colors you wish to use and you're all set!
