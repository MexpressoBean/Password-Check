# Password Security check script
# This script can be used to check a given password against a large dataset of known bad 
# passwords that have been recovered and included in past security breaches.
# See readme.md for more background information about HaveIBeenPwned API and script usage/setup.

# Steps taken to check a password that is given by user
# ------------------------------------------------------
# 1. Get password input from user as command line argument
# 2. Create password hash using SHA-1 algorithm (creates 40 character hex hash)
# 3. Retrieve first five characters of the password hash, this is the prefix
# 4. Use the hash prefix as input and make HTTP GET request to PwnedPasswords(HIBP) API
# 5. Parse the reponse data into objects that can be easily worked with
# 6. Run a check to see if the original password hash matches the prefix + any of the suffixes in the response data
# 7. If there is a match, password has been located in known bad password data and is NOT secure
# 8. If there is no match, the password being checked is not found and is fine to use (according HIBP API)
# 

require "uri"
require "net/http"
require "digest/sha1"

