from pybtex.database.input import bibtex

#open a bibtex file
parser = bibtex.Parser()
bibdata = parser.parse_file("myrefs.bib")

#loop through the individual references
for bib_id in bibdata.entries:
    b = bibdata.entries[bib_id].fields
    try:
        # change these lines to create a SQL insert
        print(b["title"])
        print(b["journal"])
        print(b["year"])
        #deal with multiple authors
        for author in bibdata.entries[bib_id].persons["author"]:
            print(author.first(), author.last())
    # field may not exist for a reference
    except(KeyError):
        continue
