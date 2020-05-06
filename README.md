# graphite-probe-linux [![Build Status](https://travis-ci.org/ccnmtl/graphite-probe-linux.svg?branch=master)](https://travis-ci.org/ccnmtl/graphite-probe-linux)

Extract various system stats and submit to a Carbon/Graphite server.

Aims to be a fairly faithful port of the old graphite-probe-linux Perl
script, with no external dependencies.

    % ./gprobe.py --help
    usage: gprobe.py [-h] --prefix PREFIX --graphite GRAPHITE [--port PORT]
                     [--debug DEBUG]
    
    optional arguments:
      -h, --help           show this help message and exit
      --prefix PREFIX      graphite prefix
      --graphite GRAPHITE  carbon host
      --port PORT          carbon port
      --debug DEBUG        just print values, don't send

So your cron entry will be something like:

    * * * * * /path/to/gprobe.py --prefix=server.example --graphite=graphite.example.com

Tested on Ubuntu against Python 2.7 and 3.3.
