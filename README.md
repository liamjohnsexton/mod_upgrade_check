# mod_upgrade_check

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with mod_upgrade_check](#setup)
    * [What mod_upgrade_check affects](#what-mod_upgrade_check-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with mod_upgrade_check](#beginning-with-mod_upgrade_check)
3. [Usage](#usage)
4. [Limitations](#limitations)
5. [Development](#development)

## Description

Knowing the complexity of the modules installed on your Puppet estate is essential to any successful Puppet migration. This provides information about the modules contained in each of your code environments.

## Setup

### What mod_upgrade_check affects

This module does not affect any of your Puppet estate. It simply reads the Puppet master and outputs its observations to CSV files.

### Setup Requirements

Please ensure you have the credentials to log into the root of the Puppet master of your estate.

### Beginning with mod_upgrade_check

The bolt plan: "grab_module_info" is the only item that needs to be run in order to obtain module complexity for each code environment. The CSV files that come from each task that is run are outputted to folders named after each code environment.

## Usage

To run this module, run the following command from your local workstation, with the Puppet master being your target:
 
``` puppet
bolt plan run mod_upgrade_check::grab_module_info --targets <fqdn of PE_master> --user <username> --private-key <key> --run-as root
```

The CSV files produced are saved into folders for each code environment to your local workstation. 

**These folders are created in the the directory you have run the command from.**

## Limitations

As mentioned previously, the plan **should only be run from your local workstation** in order to obtain full value from the module.

## Development

For any assistance in using or understanding this module, please contact: liam.sexton@puppet.com
