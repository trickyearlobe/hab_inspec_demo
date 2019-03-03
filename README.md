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

Examine the static config (from default.toml and user.toml) to see what can be configured.
NOTE: This is NOT the running config.

``` bash
hab config show trickyearlobe/hab_inspec_demo
```

Dynamically apply a new config for Automate reporting

``` bash
# First create a toml file with the new settings
echo "[a2]" > a2_reporting.toml
echo "fqdn = 'my.new.a2.fqdn'" >> a2_reporting.toml
echo "token = 'aqx06dMsRzw8ec3QidiR5lRoIGQ='" >> a2_reporting.toml
echo "sleep = '300'" >> a2_reporting.toml

# Then apply it to the running service group
hab config apply hab_inspec_demo.default 1 a2_reporting.toml

# And maybe some others if you have them
hab config apply hab_inspec_demo.uat 1 a2_reporting.toml
hab config apply hab_inspec_demo.production 1 a2_reporting.toml
```