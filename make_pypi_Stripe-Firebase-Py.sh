#!/bin/bash

# Step 1: Directory structure
# Assuming you're in the directory containing myscript.py


# Step 2: Write setup.py
cat >setup.py <<EOL
from setuptools import setup, find_packages

# Read the content of README.md
with open("README.md", "r", encoding="utf-8") as f:
    long_description = f.read()

setup(
    name="Stripe-Firebase-Py",
    version="0.2",
    packages=find_packages(),
    py_modules=["stripe_models"],
    long_description=long_description,
    long_description_content_type="text/markdown",
    license="MIT",
    install_requires=[
        # Add dependencies here
        "stripe",
        "google-cloud-firestore"
    ]

    #    entry_points={
    #        'console_scripts': [
    #            'stripe_models=stripe_models:main',  # If you have a 'main' function in your script
    #        ],
    #    },
)
EOL

# Step 3: We're skipping this because it requires human interaction

# Step 4: Build your package
pip install setuptools wheel
python setup.py sdist bdist_wheel

# Step 5: Upload your package
pip install twine
twine upload dist/*

# Note: The above will prompt you for your PyPI username and password.
# For more automation, consider using API tokens or .pypirc configurations.
# Just ensure your credentials are secured and not hardcoded in the script.

echo "Package uploaded to PyPI!"
