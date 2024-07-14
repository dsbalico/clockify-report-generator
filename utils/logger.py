from colorama import init, Fore, Style

# Initialize colorama
init(autoreset=True)

def initialize_logger():
    import logging

    class ColoredFormatter(logging.Formatter):
        def format(self, record):
            levelname = f"{Fore.GREEN}{record.levelname}{Style.RESET_ALL}"
            message = f"{record.getMessage()}"
            return f"[{levelname}]: {message}"

    logger = logging.getLogger(__name__)
    logger.setLevel(logging.DEBUG)

    console_handler = logging.StreamHandler()
    console_handler.setFormatter(ColoredFormatter())
    logger.addHandler(console_handler)

    return logger