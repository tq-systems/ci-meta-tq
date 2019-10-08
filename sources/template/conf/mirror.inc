# control usage of mirrors
# PREMIRRORS should be setup in site.conf
#### INHERIT += "own-mirrors"
INHERIT += "${@ 'own-mirrors' if d.getVar('SOURCE_MIRROR_URL') else ''}"
