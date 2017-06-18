#!/usr/bin/python

import json
import re
import subprocess

from ansible.module_utils.basic import *

def _escape_single_quotes(string):
    return re.sub("'", r"'\''", string)

def _set_value(user, key, value):

    command = " ".join([
        'export `/usr/bin/dbus-launch`',
        ';',
        '/usr/bin/dconf write', key, "'%s'" % _escape_single_quotes(value),
        ';',
        'kill $DBUS_SESSION_BUS_PID &> /dev/null'
    ])

    if user is None:
        return subprocess.check_output(['/bin/sh', '-c', command]).strip()

    return subprocess.check_output([
        'su', '-', user , '-c', command
    ]).strip()

def _get_value(user, key):

    command = " ".join([
        'export `/usr/bin/dbus-launch`',
        ';',
        '/usr/bin/dconf read', key,
        ';',
        'kill $DBUS_SESSION_BUS_PID &> /dev/null'
    ])

    if user is None:
        return subprocess.check_output(['/bin/sh', '-c', command]).strip()

    return subprocess.check_output([
        'su', '-', user , '-c', command
    ]).strip()

def main():

    module = AnsibleModule(
        argument_spec = {
            'state': { 'choices': ['present'], 'default': 'present' },
            'user': { 'default': None },
            'key': { 'required': True },
            'value': { 'required': True },
        },
        supports_check_mode = True,
    )

    params = module.params
    state = module.params['state']
    user = module.params['user']
    key = module.params['key']
    value = module.params['value']

    old_value = _get_value(user, key)
    changed = old_value != value

    if changed and not module.check_mode:
        _set_value(user, key, value)

    print json.dumps({
        'changed': changed,
        'key': key,
        'value': value,
        'old_value': old_value,
    })

main()
