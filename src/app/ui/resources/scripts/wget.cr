module Scripts
    SNATCH_SCRIPT = ->(domain : String) {
        "ROOTPATH=~/Documents; wget --recursive --page-requisites --adjust-extension --span-hosts --convert-links --restrict-file-names=windows --domains #{domain} --no-parent #{domain} --directory-prefix=$ROOTPATH"
    }
end