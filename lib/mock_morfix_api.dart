import 'package:instant_morfix/morfix_api.dart';

class MockMorfixApi implements MorfixApi {
  Future<String> getTranslation(String query) async {
    return Future<String>.value("""
  {
    "ResultType": "Match",
    "Status": "Valid",
    "AlternateList": [],
    "Query": "שלום",
    "ReviseList": [],
    "CorrectionList": [],
    "CorrectionListL2": [],
    "TranslationType": "ToEnglish",
    "TranslationTypeValue": 2,
    "OneSuggestionOperatedFor": "",
    "OneAlternateOperatedFor": null,
    "Words": [
        {
            "ID": "12168",
            "InputLanguageMeanings": [
                [
                    {
                        "DisplayText": "שָׁלוֹם",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "OutputLanguageMeanings": [
                [
                    {
                        "DisplayText": "peace",
                        "Translation": " שָׁלוֹם; שַׁלְוָה, שֶׁקֶט",
                        "SoundURL": ""
                    }
                ],
                [
                    {
                        "DisplayText": "Hello!",
                        "Translation": "",
                        "SoundURL": ""
                    },
                    {
                        "DisplayText": "Goodbye",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ],
                [
                    {
                        "DisplayText": "welfare",
                        "Translation": " רְוָחָה, סַעַד; קצבת סעד",
                        "SoundURL": ""
                    },
                    {
                        "DisplayText": "wellbeing",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ],
                [
                    {
                        "DisplayText": "בשלום - safely",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ],
                [
                    {
                        "DisplayText": "בשלום - peacefully",
                        "Translation": "",
                        "SoundURL": ""
                    },
                    {
                        "DisplayText": "at peace",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "PartOfSpeech": "שֵם ז'",
            "OutputLanguageMeaningsString": "peace  ; Hello!, Goodbye  ; welfare, wellbeing  ; בשלום - safely  ; בשלום - peacefully, at peace",
            "isExactMatch": "",
            "WOTDimageURL": "",
            "WOTDtooltip": "",
            "TranslationIdenticalToSource": null,
            "Inflections": [],
            "SampleSentences": [],
            "SynonymsList": [],
            "UsageNotes": "",
            "AdditionalContentList": [],
            "SynonymsBlocks": null,
            "SynonymsLinks": []
        },
        {
            "ID": "12169",
            "InputLanguageMeanings": [
                [
                    {
                        "DisplayText": "שִׁלּוּם",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "OutputLanguageMeanings": [
                [
                    {
                        "DisplayText": "payment",
                        "Translation": " תַּשְׁלוּם",
                        "SoundURL": ""
                    }
                ],
                [
                    {
                        "DisplayText": "reparations",
                        "Translation": " שִׁפּוּץ, תִּקּוּן, חִדּוּשׁ; פִּצּוּי, שִׁלּוּם",
                        "SoundURL": ""
                    }
                ],
                [
                    {
                        "DisplayText": "remuneration",
                        "Translation": " פִּצּוּי, גְּמוּל; תַּשְׁלוּם",
                        "SoundURL": ""
                    },
                    {
                        "DisplayText": "recompense",
                        "Translation": " פִּצּוּי, שִׁפּוּי",
                        "SoundURL": ""
                    }
                ],
                [
                    {
                        "DisplayText": "שילומים - reparations",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "PartOfSpeech": "שֵם ז'",
            "OutputLanguageMeaningsString": "payment  ; reparations; remuneration, recompense  ; שילומים - reparations",
            "isExactMatch": "",
            "WOTDimageURL": "",
            "WOTDtooltip": "",
            "TranslationIdenticalToSource": null,
            "Inflections": [],
            "SampleSentences": [],
            "SynonymsList": [],
            "UsageNotes": "",
            "AdditionalContentList": [],
            "SynonymsBlocks": null,
            "SynonymsLinks": []
        },
        {
            "ID": "12149",
            "InputLanguageMeanings": [
                [
                    {
                        "DisplayText": "שָׁלָה",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "OutputLanguageMeanings": [
                [
                    {
                        "DisplayText": "to pull out (from a liquid)",
                        "Translation": " שָׁלַף, חִלֵּץ, תָּלַשׁ, עָקַר; נָסוֹג, הִסִּיג",
                        "SoundURL": ""
                    }
                ]
            ],
            "PartOfSpeech": "פ' קל",
            "OutputLanguageMeaningsString": "to pull out (from a liquid)",
            "isExactMatch": "",
            "WOTDimageURL": "",
            "WOTDtooltip": "",
            "TranslationIdenticalToSource": null,
            "Inflections": [],
            "SampleSentences": [],
            "SynonymsList": [],
            "UsageNotes": "",
            "AdditionalContentList": [],
            "SynonymsBlocks": null,
            "SynonymsLinks": []
        },
        {
            "ID": "1364",
            "InputLanguageMeanings": [
                [
                    {
                        "DisplayText": "לָוָה",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "OutputLanguageMeanings": [
                [
                    {
                        "DisplayText": "to borrow",
                        "Translation": " שָׁאַל, לָקַח בְּהַשְׁאָלָה, לָוָה; הֶעֱתִיק (אמירה, רעיון או שיטה ממישהו אחר)",
                        "SoundURL": ""
                    }
                ]
            ],
            "PartOfSpeech": "פ' קל",
            "OutputLanguageMeaningsString": "to borrow",
            "isExactMatch": "",
            "WOTDimageURL": "",
            "WOTDtooltip": "",
            "TranslationIdenticalToSource": null,
            "Inflections": [],
            "SampleSentences": [],
            "SynonymsList": [],
            "UsageNotes": "",
            "AdditionalContentList": [],
            "SynonymsBlocks": null,
            "SynonymsLinks": []
        },
        {
            "ID": "45766",
            "InputLanguageMeanings": [
                [
                    {
                        "DisplayText": "לוֹם",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "OutputLanguageMeanings": [
                [
                    {
                        "DisplayText": "(Russian) long crow bar-type pole",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "PartOfSpeech": "שֵם ז'",
            "OutputLanguageMeaningsString": "(Russian) long crow bar-type pole",
            "isExactMatch": "",
            "WOTDimageURL": "",
            "WOTDtooltip": "",
            "TranslationIdenticalToSource": null,
            "Inflections": [],
            "SampleSentences": [],
            "SynonymsList": [],
            "UsageNotes": "",
            "AdditionalContentList": [],
            "SynonymsBlocks": null,
            "SynonymsLinks": []
        },
        {
            "ID": "1368",
            "InputLanguageMeanings": [
                [
                    {
                        "DisplayText": "לִוָּה",
                        "Translation": "",
                        "SoundURL": ""
                    }
                ]
            ],
            "OutputLanguageMeanings": [
                [
                    {
                        "DisplayText": "to accompany",
                        "Translation": " לִוָּה, נִלְוָה; הוֹסִיף, צֵרֵף",
                        "SoundURL": ""
                    },
                    {
                        "DisplayText": "to escort",
                        "Translation": " לִוָּה",
                        "SoundURL": ""
                    }
                ]
            ],
            "PartOfSpeech": "פ' פיעל",
            "OutputLanguageMeaningsString": "to accompany, to escort",
            "isExactMatch": "",
            "WOTDimageURL": "",
            "WOTDtooltip": "",
            "TranslationIdenticalToSource": null,
            "Inflections": [],
            "SampleSentences": [],
            "SynonymsList": [],
            "UsageNotes": "",
            "AdditionalContentList": [],
            "SynonymsBlocks": null,
            "SynonymsLinks": []
        }
    ],
    "WordsL2": [],
    "Tokens": [],
    "QueryRelatedCollocations": [],
    "QueryRelatedPhrasalVerbs": [],
    "QueryRelatedCollocationsObject": [],
    "WikipediaList": [],
    "ShouldUseMachineTranslate": "false",
    "InputTokenize": [
        "שלום"
    ],
    "MachineTranslateResult": null
}
  """);
  }
}
