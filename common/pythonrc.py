import sys
try:
    from importlib import reload
except ImportError:
    from imp import reload
if sys.version_info.major == 2:
    reload(sys)
    sys.setdefaultencoding('utf-8')


# try:
#     from chameleon import exc
#     exc._ellipsify = exc.ellipsify
#     exc.ellipsify = lambda x, y: x
# except ImportError:
#     pass


try:
    from pkgutil import iter_modules
    from Products.PythonScripts.Utility import allow_module
    [allow_module(module[0]) for module in iter_modules()]
except:
    pass
