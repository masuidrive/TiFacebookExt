TiFacebookExt
===========================================

This is a Titanium.Facebook module exntender for Titanium Mobile iPhone.

Added two functions.

* Titanium.Facebook.showLoginDialog();
* Titanium.Facebook.sessionLogout();


INSTALL TiFacebookExt
--------------------

1. Open `Terminal`
2. Run below command

	`python build.py && unzip facebookext-iphone-0.1.zip -d /Library/Application\ Support/Titanium/`


REGISTER TO YOUR PROJECT
---------------------

Register your module with your application by editing `tiapp.xml` and adding your module.
Example:

	<modules>
		<module version="0.1">FacebookExt</module>
	</modules>

When you run your project, the compiler will know automatically compile in your module
dependencies and copy appropriate image assets into the application.


LICENSE
---------------------
MIT License

Copyright 2010 Yuichiro MASUI (masuidrive)
