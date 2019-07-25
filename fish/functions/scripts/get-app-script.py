path = raw_input().split('/')
print '/' + path[path.index('vtex') + 1] if 'vtex' in path else ''
