This text can also be viewed online in the Public, freely accessible mail archive:
https://lists.w3.org/Archives/Public/public-xsl-wg/2016Feb/0001.html


### GETTING THE REPO ###

You can find the test suite publicly available as a Mercurial (Hg) repository: https://dvcs.w3.org/hg/xslt30-test/

To use it, you need a Mercurial client. Mercurial is a DVCS similar to Github and the like. Most popular on Windows is TortoiseHg which has a port for Mac OS X and Gnome/Nautilus: http://tortoisehg.bitbucket.org/. Just install and point select "Close repository", type in the URL above and you should be good to go after the repo has been downloaded.

If you don't feel like using a DVCS, you can download a ZIP archive from the above link. Changes can then be mailed to me and I will add them to the repository.

For committing changes you need write access. Liam can help you with that, but if you have a W3C account already, I think you get write access automatically. Mercurial is set up to always require a password when committing changes, even if you store the password in your client.

### GETTING AROUND ###

At first the test suite may look a bit daunting. A lot of documentation can be found in the catalog-schema.xsd in the <root>/admin directory. When editing or adding tests, it is best that you validate the XML against this schema (oXygen can do this automatically and will also give you tooltip and other context-sensitive help).

The tests themselves are structured as follows:

Catalog.xml: this contains the catalog of all tests. It is a list of <test-set> elements that themselves point to named test-sets in other XML files. Typically you will not need to edit this file unless you are going to add a new category or group of tests. In oXygen you can hit Ctrl-Enter on any of these test-set @file attributes to go directory to the test-set XML file.

<root>/tests/: this directory contains all the tests. On top of each subdirectory is a test-set XML file, say _accept-test-set.xml which typically has a name that matches the category. When working on a category, this is the file to edit. Test sets are organized in main groups, like "attr" for testing attributes of XSLT instructions and "decl" for XSLT declarations. Under each of these is a further specialization, like "import-schema" directory for <xsl:import-schema> tests.

_xxxx-test-set.xml:  files on top of each test-set directory start with an underscore to easily find them in the directory. The structure of test-sets has a number of <environment> on top which describe some metadata of the test, mainly the XSLT and XML source files, collections or other dependencies. The element <dependencies> sets whether tests are dependent on XSLT 3.0 or 2.0 or a certain other feature, like higher-order-functions. The bulk of each of these files consists of a long list of <test-case> elements. These contain the meta-information for the actual tests. The easy thing to do is to take a test that closely resembles the metadata you are going to need for your next test, copy the <text-case> element, update the name (it must be unique, the numbering is up to you) and update the XSLT source. If necessary, update other dependencies as well.

### WRITING TESTS ###

First, I set up oXygen to have two Transformation Scenarios for each processor I want to use: one that takes as input an XSLT source and an XML source by the same name as the XSLT source (with only the extension different) and one that runs an XSLT source without any input, using the "xsl:initial-template" feature of XSLT 3.0.

Here's the way I do it then:

1) Open the _xxxx_test-set.xml in oXygen
2) Locate a test that is close to what you want to do
3) Create or copy the XSLT file, number it closely to the test, say accept-010.xsl
4) Add a source file with the same name, accept-010.xml (even if such file already exists, in which case the <environment> in the test set does not need to change, but this is just easier one-click testing)
5) Write the test using XSLT features that you know should work
6) Run it successfully
7) Update the test with features you are unsure should work (i.e., the part you want to actually test)
8) Run again, whether fail or success is now irrelevant, but from step (5) you know your XSLT is probably valid
9) Copy a bunch of <test-case> with similar parameters that test variants of your current scenario

With all this, I usually use the new XSLT feature for static parameters heavily, because that makes it easier to write many tests without requiring a new XSLT stylesheet for each test. This is also the way Michael Kay often does it.

### COMMITTING TESTS ###

Once you are done, commit your changes.  *Always* write a comment when committing so that others know what you added and why. If there is a bug entry that is relevant to the tests, mention that.

Do not add redundant files. You can right-click and ignore them with TortoiseHg so that you do not accidentally commit them, or just don't select them in the commit window of your Mercurial client.

Thanks and happy testing!