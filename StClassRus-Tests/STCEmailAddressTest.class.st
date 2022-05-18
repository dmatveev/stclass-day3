Class {
	#name : #STCEmailAddressTest,
	#superclass : #TestCase,
	#instVars : [
		'email',
		'emailString'
	],
	#category : #'StClassRus-Tests'
}

{ #category : #initialization }
STCEmailAddressTest >> setUp [
	super setUp.
	emailString := 'user@example.com'.
	email := STCEmailAddress from: emailString.
]

{ #category : #testing }
STCEmailAddressTest >> testCreation [
	| e |
	e := STCEmailAddress new
		user: 'user';
		domain: 'example.com'.
	self assert: e user equals: 'user'.
	self assert: e domain equals: 'example.com'
]

{ #category : #testing }
STCEmailAddressTest >> testDomain [
	self assert: email domain equals: 'example.com'
]

{ #category : #testing }
STCEmailAddressTest >> testFrom [
	self shouldnt: [STCEmailAddress from: 'user@example.org'] raise: STCError.
	self shouldnt: [STCEmailAddress from: 'user-name@server-name.com'] raise: STCError.
]

{ #category : #testing }
STCEmailAddressTest >> testFromInvalid [
	self should: [ STCEmailAddress from: '' ] raise: Error. 
]

{ #category : #testing }
STCEmailAddressTest >> testName [
	self assert: email name equals: 'user'
]

{ #category : #testing }
STCEmailAddressTest >> testPrintOn [
	| s |
	s := WriteStream on: ''.
	email printOn: s.
	self assert: s contents equals: emailString
]

{ #category : #testing }
STCEmailAddressTest >> testPrintString [
	self assert: email printString equals: emailString
]
