#!/usr/bin/env python
import io
import os
import sys

from setuptools import find_packages, setup


if sys.argv[-1] == 'publish':
    os.system('python setup.py sdist upload')
    os.system('python setup.py bdist_wheel upload')
    sys.exit()


readme = io.open('README.rst', 'r', encoding='utf-8').read()

setup(
    name='',
    description='',
    long_description=readme,
    url='',
    author='',
    author_email='',
    version='0.0.0',
    license='',
    packages=find_packages(),
    tests_require=[],
    setup_requires=[],
    install_requires=[
    ],
    classifiers=[],
    entry_points=""""""
)
