# Golink

`Golink` is a utility script that facilitates the launching of web URLs with the option of appending search queries directly from the desktop using `dmenu`. This script provides a streamlined way to access your most frequently visited websites and perform searches when applicable.

## Features

- **Dynamic URL Processing**: Determines if a URL can have search terms appended dynamically.
- **Minimalist Interface**: Utilizes `dmenu` for a clean and easy-to-use interface.
- **Smart Redirection**: Automatically redirects to a base URL if no search terms are entered for URLs that support them.

## Prerequisites

To use `Golink`, ensure the following tools are installed on your system:
- `dmenu`: For handling user input through a graphical interface.
- Standard utilities: `awk`, `sed`, `grep`, and a web browser (Firefox is used by default).

## Installation

1. **Download the Script:**
   Assuming you have git installed, clone your repository or directly download the `golink` script into the desired location.

2. **Place the Script:**
   Move the script to `~/.local/bin` to make it easily executable from anywhere:
   ```bash
   ln -s /path/to/golink ~/.local/bin/golink
   ```

3. **Make the Script Executable:**
   Ensure the script has the necessary execution permissions:
   ```bash
   chmod +x /path/to/golink
   ```

4. **Configure URLs:**
   Place your URLs in `~/.dotfiles/urls.txt`. Each line should contain a keyword and a URL, optionally with a placeholder for search terms:
   ```
   youtube https://www.youtube.com/results?search_query=
   github https://github.com/search?q=
   ```

## Usage

Run the script simply by typing in dmenu:
```bash
golink
```
Select a keyword through `dmenu`, and if applicable, enter your search terms. If no terms are entered and the URL supports them, you'll be redirected to the default homepage of the service.

## Customization

- **Default Browser**: Change the default browser by modifying the `browser` variable in the script.
  ```bash
  browser="your_preferred_browser"
  ```

## Contributing

Feel free to fork the project and submit pull requests or suggestions. Your contributions are greatly appreciated!

## License

`Golink` is freely distributed under the MIT License. 

