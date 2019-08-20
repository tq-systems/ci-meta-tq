# control usage of mirrors
# PREMIRRORS should be setup in site.conf
#### INHERIT += "own-mirrors"
INHERIT += "${@ 'own-mirrors' if d.getVar('SOURCE_MIRROR_URL') else ''}"
# use git shallow clones
BB_GIT_SHALLOW = "1"
BB_GIT_SHALLOW_DEPTH = "1"

