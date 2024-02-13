My Vector role
=========

This role deploy `vector` service with simple config (whith `sinks - clickhouse`) in your prepared machine.

Role Variables
--------------

**ENV_VAR (required!!!):**

`CLICKHOUSE_LOCAL_IP` - env var with local IP clickhouse host

**Roles vars:**

`vector_config_dir` - directory with vector configuration files in your machine

`vector_version` - necessary vector version to download install packet

`clickhouse_user` - user name for connetction to clickhouse DB 

`clickhouse_password` - password of user name for connetction to clickhouse DB 

`dest_host` - clickhouse host IP (value taken from CLICKHOUSE_LOCAL_IP env)  

Example Playbook
----------------

    - hosts: vector
      roles:
        - role: vector-role
          vars:
            dest_host: <Clickhouse host IP>
            clickhouse_user: <Clickhouse database user name>
            clickhouse_password: <Clickhouse database user password>

License
-------

MIT

Author Information
------------------

D.A. Suetin (aka ditry86)
