
# puppet_utils

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with puppet_utils](#setup)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Description

puppet_utils is a collection of various utilities and examples, like tasks, plans and functions.

## Setup

Just install this module or put it in your Puppetfile.

## Usage

After installation, all functions, tasks and plans become available.

## Reference

### Tasks

#### puppet_utils::echo

Echoes its parameter `message`

#### puppet_utils::random

Returns $RANDOM - a number between 0 and 32767

### Functions

#### run_task_until

##### Parameters

* task_name (String)
* targets (Target, String or an array of either)
* task_args (optional, Hash)
* code block

##### Return type

`ResultSet`

##### Description

`run_task_until` executes the task specified in `task_name` until the code block is true. The task will be executed at least once.

### Plans

#### puppet_utils::run_task_until

##### Parameters

* node (String): the node to run the task on

##### Description

Demonstrates two ways of calling a task inside a loop.

##### Usage

`bolt plan run puppet_utils::run_task_until node=$node --modulepath $modulepath`

Note: depends on puppetlabs/stdlib for the chomp() function

## Limitations

This is demo content, use it at your own risk.

## Development

All contributions are welcome in the form of pull requests.
