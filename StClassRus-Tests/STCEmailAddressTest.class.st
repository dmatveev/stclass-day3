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

{ #category : #initialization }
STCEmailAddressTest >> testCreation [
	| e |
	e := STCEmailAddress new
		user: 'user';
		domain: 'example.com'.
	self assert: e user equals: 'user'.
	self assert: e domain equals: 'example.com'
]

{ #category : #initialization }
STCEmailAddressTest >> testDomain [
	self assert: email domain equals: 'example.com'
]

{ #category : #initialization }
STCEmailAddressTest >> testFrom [
	self shouldnt: [STCEmailAddress from: 'user@example.org'] raise: STCError.
	self shouldnt: [STCEmailAddress from: 'user-name@server-name.com'] raise: STCError.
]

{ #category : #initialization }
STCEmailAddressTest >> testFromInvalid [
	self should: [ STCEmailAddress from: '' ] raise: Error. 
]

{ #category : #initialization }
STCEmailAddressTest >> testName [
	self assert: email name equals: 'user'
]

{ #category : #initialization }
STCEmailAddressTest >> testPrintOn [
	| s |
	s := WriteStream on: ''.
	email printOn: s.
	self assert: s contents equals: emailString
]

{ #category : #initialization }
STCEmailAddressTest >> testPrintString [
	self assert: email printString equals: emailString
]
