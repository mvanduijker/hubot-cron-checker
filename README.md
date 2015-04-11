# Hubot Cron Checker

[![Build Status](https://travis-ci.org/mvanduijker/hubot-cron-checker.svg)](https://travis-ci.org/mvanduijker/hubot-cron-checker)
[![npm version](https://badge.fury.io/js/hubot-cron-checker.svg)](http://badge.fury.io/js/hubot-cron-checker)

Explains crontab entry in normal english using http://cronchecker.net

## Usage

For help `hubot exlain me cron`

`hubot explain me cron <cron entry>` to translate the cron entry in plain english. For example `hubot explain me cron 0 0 * * * some_report.sh`

## Installation

```bash
npm install --save hubot-cron-checker
```

Add `hubot-cron-checker` to your `external-scripts.json` file.

## Credits

Many thanks to [Patrick Byrne](https://github.com/pbyrne) for making http://cronchecker.net
