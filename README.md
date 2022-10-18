# auxiliary-projects

Darey.io Auxiliary project implementation

This project contains scripts to onboard/offboard users onto/off a linux machine.

The names of the users are stored in a **default** file called `first_names.csv`

### Common commands
Clone the repo, and enter the `Shell` sub directory
```bash
$ git clone https://github.com/toritsejuFO/auxiliary-projects.git
$ cd auxiliary-projects/Shell
```

### Onboarding users
with default file
```bash
$ ./onboarding-users.sh
```

or by passing a custom/different csv file
```bash
$ ./onboarding-users.sh my_custom_file.csv
```

### Offboarding users
with default file
```bash
$ ./offboarding-users.sh
```

or by passing a custom/different csv file
```bash
$ ./offboarding-users.sh my_custom_file.csv
```
