Lighthouse-role
=========

Install lighthouse in your dest machine

Requirements
------------

Machine must be running on Centos. Lighthouse instalation is running via git. 

Role Variables
--------------

`lighthouse_source_url` - URL to source git repo of lighthouse
 `lighthouse_dir` - instalation directory of lighthouse (NGINX/Apache web source directory)

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: lighthouse
      roles:
         - role: lighthouse-role
           vars:
            lighthouse_dir: <path of NGINX/Apache web source dir>

License
-------

MIT

Author Information
------------------

D.A. Suetin (aka ditry86)
