# Shopping List

A shopping list application, made as a test project given to me by eŠola d.o.o. as a test task.

## Features
- Adding items to the list
- Removing items from the list
- Editing items in the list
- Syncing the list with the server

## Usage
- Add items to the list by pressing the "Add new item" button
- Edit and remove item from the list by long pressing on the chosen item
- Mark item as bought by pressing the checkbox

## Building

### Prerequisites
- Installed Flutter
- Installed Android or iOS development tools

### Process
Clone this repository and move into it
```bash
git clone https://github.com/aikenahac/shopping-list.git
cd shopping-list
```

Install the dependencies
```bash
flutter pub get
```

Generate serializable classes
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

And then run the application
```bash
flutter run [-d device_id]
```

## About the server
For the backend I'm using a Strapi backend hosted on a private VPS.

The API is running on `https://sl.aikenahac.com/api`.

The endpoints used are:

| Type | Endpoint | Description |
| ---- | -------- | ----------- |
| GET  | /items    | Get all items |
| POST | /items    | Add new item |
| PUT  | /items/:id | Edit item |
| DELETE | /items/:id | Delete item |

## License
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)