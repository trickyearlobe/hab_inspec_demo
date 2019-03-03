# hab_inspec_demo

This is a simple Inspec profile deployed by Habitat along with the Inspec client. It reports back to a Chef Automate 2 server.

Feel free to fork it and hack on it.

## Using it

Install Habitat from https://habitat.sh and either

* Set it to run as a service.
* Enter your Habitat studio

Load the service in your habitat supervisor

``` bash
hab svc load trickyearlobe/hab_inspec_demo --strategy at-once
```
