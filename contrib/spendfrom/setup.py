from distutils.core import setup
setup(name='XRDspendfrom',
      version='1.0',
      description='Command-line utility for ravendark "coin control"',
      author='Gavin Andresen',
      author_email='gavin@ravendarkfoundation.org',
      requires=['jsonrpc'],
      scripts=['spendfrom.py'],
      )
