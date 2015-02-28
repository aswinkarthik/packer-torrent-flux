## Creating a digital ocean droplet using packer

WORK IN PROGRESS

### Requirements
- Packer

### Configuration
- Create a file called `config.sh`
- Set environment variables DO\_API\_KEY, DO\_CLIENT\_ID, TFLUX\_URL depending on your Digital ocean API Key, Client_ID.
- Look at template file `config.sh.tmpl`

### Example configuration file

```
export DIGITALOCEAN\_API\_KEY="APPROPRIATE_KEY"  		# For V1 API
export DIGITALOCEAN\_CLIENT\_ID="APPROPRIATE_CLIENT_ID" # For V1 API
export DIGITALOCEAN\_API\_TOKEN="APPROPRIATE_TOKEN" 	# For V2 API
export MYSQL\_PASSWORD="APPROPRIATE_MYSQL_PASSWORD" 	# MySql password
```

### Note

This is not limited to Digital Ocean. You could create a AWS, OpenStack etc. machines and have the same setup. Export necessary configuration (Environment variables) for each machines.

For necessary environment variables, refer packer docs.