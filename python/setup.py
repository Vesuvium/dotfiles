#!/usr/bin/env python
import io

from setuptools import find_packages, setup


readme = io.open('README.md', 'r', encoding='utf-8').read()

setup(
    name='',
    description='',
    long_description=readme,
    url='',
    author='Jacopo Cascioli',
    author_email='noreply@jacopocascioli.com',
    version='0.0.0',
    license='',
    packages=find_packages(),
    tests_require=[
        'pytest>=4.3.1',
        'pytest-cov>=2.6.1',
        'pytest-mock>=1.10.1'
    ],
    setup_requires=[],
    install_requires=[
    ],
    classifiers=[],
    entry_points={
        'console_scripts': ['package=package.Cli:Cli.main']
    }
)
