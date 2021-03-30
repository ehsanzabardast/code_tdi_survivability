import requests
import pandas as pd
from requests.auth import HTTPBasicAuth

'''
The information provided in this script will help you extract the sonarqube data from the web API
You will be instructed to change certain variables in this script
This script will fetch all SonarQube issues for a specific component key (= project)
'''


def _get_issues(base_url, component_key, user=None, pwd=None, facets=None):
    base_url = base_url.strip('/')
    page_size = 500
    page = 1
    issues_read = 0
    num_issues = None
    all_issues = []
    while not num_issues or issues_read < num_issues:
        url = f'{base_url}/api/issues/search?ps={page_size}&p={page}&componentKeys={component_key}'
        if facets:
            url += f'&facets={facets}'
        try:
            r = requests.get(url, auth=HTTPBasicAuth(user, pwd) if user else None)
            r.raise_for_status()
        except requests.exceptions.HTTPError as e:
            print(e)
            break
        json_obj = r.json()
        num_issues = int(json_obj['total'])
        for issue in json_obj['issues']:
            all_issues.append(issue)
        issues_read += page_size
        page += 1
    return all_issues


def _map_dict_i(d):
    return [d['key'],
            d['component'],
            d['project'],
            d['rule'],
            d['status'],
            d['resolution'] if 'resolution' in d.keys() else '',
            d['severity'],
            d['message'],
            d['line'] if 'line' in d.keys() else '',
            d['hash'] if 'hash' in d.keys() else '',
            d['author'] if 'author' in d.keys() else '',
            d['effort'] if 'effort' in d.keys() else '',
            d['creationDate'],
            d['updateDate'],
            d['attr']['jira-issue-key'] if 'attr' in d.keys() else '',
            d['textRange']['startLine'] if 'textRange' in d.keys() else '',
            d['textRange']['endLine'] if 'textRange' in d.keys() else '',
            d['textRange']['startOffset'] if 'textRange' in d.keys() else '',
            d['textRange']['endOffset'] if 'textRange' in d.keys() else '',
            d['type'],
            d['organization']
            ]


def _main():
    issues = [_map_dict_i(i) for i in issues_list]
    df_issues = pd.DataFrame(data=issues, columns=['key',
                                                   'component',
                                                   'project',
                                                   'rule',
                                                   'status',
                                                   'resolution',
                                                   'severity',
                                                   'message',
                                                   'line',
                                                   'hash',
                                                   'author',
                                                   'effort',
                                                   'creation_date',
                                                   'update_date',
                                                   'jira_issue_key',
                                                   'start_line',
                                                   'end_line',
                                                   'start_offset',
                                                   'end_offset',
                                                   'type',
                                                   'organization'
                                                   ])
    df_issues.set_index(keys=['key'], drop=True, inplace=True)
    '''
    Here you have to put the name of file, for example: EXAMPLE_DATA.csv
    '''
    df_issues.to_csv(path_or_buf='data/EXAMPLE_DATA.csv')
    print('Done!')


'''
Here you have to insert:
1) The base url for the API
2) The component key from sonarqube
3) user (optional) for authentication
4) pwd (optional) for authentication
'''
if __name__ == '__main__':
    issues_list = _get_issues(base_url="https://sonarcloud.io",
                              component_key="apache_struts"
                              # ,user='abc', pwd='abc'
                              )
    _main()
