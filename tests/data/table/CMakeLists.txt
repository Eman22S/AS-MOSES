ADD_CXXTEST(tableUTest)
TARGET_LINK_LIBRARIES(tableUTest
    data
	moses
	ascombo
	ascomboant
	${COGUTIL_LIBRARY}
)
