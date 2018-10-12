#!/bin/env python
'''Super simple script to start a multithreaded HTTP server in the current directory'''

import socket
import SocketServer
import BaseHTTPServer
import SimpleHTTPServer
import sys

class SimpleMultithreadedServer(SocketServer.ThreadingMixIn, BaseHTTPServer.HTTPServer):
    '''Placeholder class to mix together
    SocketServer.ThreadingMixIn and BaseHTTPServer.HTTPServer'''
    pass


def main():
    '''Start a multithreaded server'''

    if sys.argv[1:]:
        port = int(sys.argv[1])
    else:
        port = 8000

    server = SimpleMultithreadedServer(('', port), SimpleHTTPServer.SimpleHTTPRequestHandler)
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.connect(("8.8.8.8", 80))
    local_ip = str(sock.getsockname()[0])

    try:
        print "  IP: %s\nPort: %s" % (local_ip, port)
        while 1:
            sys.stdout.flush()
            server.handle_request()
    except KeyboardInterrupt:
        print "\nFinished"


if __name__ == '__main__':
    main()
