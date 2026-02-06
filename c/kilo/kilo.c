/*** includes ***/

#include <ctype.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>

/*** defines ***/

#define CTRL_KEY(k) ((k)&0x1f)

/*** data ***/

struct termios orig_termios;

/*** terminal ***/

// basic error handling - write error message and return
void die(const char *s) {
    perror(s);
    exit(1);
}

// we want to go back to echo mode on, when exiting our terminal
void disableRawMode() {
    if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &orig_termios) == -1)
        die("tcsetattr");
}

void enableRawMode() {

    // get current terminal attributes
    if (tcgetattr(STDIN_FILENO, &orig_termios) == -1)
        die("tcgetattr");
    atexit(disableRawMode);

    struct termios raw = orig_termios;

    raw.c_iflag &= ~(BRKINT | ICRNL | INPCK | ISTRIP | IXON);
    // turn off output processing /r/n
    raw.c_oflag &= ~(OPOST);
    raw.c_cflag |= (CS8);
    // turn off echo feature, and canonical mode, and C-c, C-v
    raw.c_lflag &= ~(ECHO | ICANON | IEXTEN | ISIG);

    // read times out in on tenth of a second
    raw.c_cc[VMIN] = 0;
    raw.c_cc[VTIME] = 1;

    // set new attributes - echo disabling takes effect
    if (tcsetattr(STDIN_FILENO, TCSAFLUSH, &raw) == -1)
        die("tcsetattr");
}

char editorReadKey() {
    int nread;
    char c;
    while ((nread = read(STDIN_FILENO, &c, 1)) != 1) {
        if (nread == -1 && errno != EAGAIN)
            die("read");
    }
    return c;
}

/*** output ***/
void editorRefreshScreen() { write(STDOUT_FILENO, "\x1b[2J", 4); }

/*** input ***/
void editorProcessKeypress() {
    char c = editorReadKey();
    switch (c) {
    case CTRL_KEY('q'):
        exit(0);
        break;
    }
}

/*** init ***/

int main() {
    enableRawMode();
    while (1) {
        editorRefreshScreen();
        editorProcessKeypress();
    }
    return 0;
}
