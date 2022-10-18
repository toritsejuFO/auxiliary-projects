# auxiliary-projects

Darey.io Auxiliary project implementation

This project contains scripts to onboard/offboard users onto/off a linux machine.

The names of the users are stored in a **default** file called `first_names.csv`

### Onboarding users
with default file
```bash
$  ./onboarding-users.sh
```

or by passing a custom/different csv file
```bash
$  ./onboarding-users.sh my_custom_file.csv
```

### Offboarding users
with default file
```bash
$  ./offboarding-users.sh
```

or by passing a custom/different csv file
```bash
$  ./offboarding-users.sh my_custom_file.csv
```
