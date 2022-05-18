"
E-mail address as defined in

   https://datatracker.ietf.org/doc/html/rfc3696#page-5


"
Class {
	#name : #STCEmailAddress,
	#superclass : #Object,
	#instVars : [
		'name',
		'domain'
	],
	#category : #StClassRus
}

{ #category : #'instance creation' }
STCEmailAddress class >> from: aString [
	"Parse aString and create an email object"
	| atidx |
	atidx := aString indexOf: $@.
	^self new
		user: (aString copyFrom: 1 to: atidx - 1);
		domain: (aString allButFirst: atidx);
		yourself
]

{ #category : #accessing }
STCEmailAddress >> domain [
	^domain
]

{ #category : #accessing }
STCEmailAddress >> domain: aString [
	domain := aString
]

{ #category : #accessing }
STCEmailAddress >> name [
	^name
]

{ #category : #accessing }
STCEmailAddress >> name: aString [
	name := aString
]

{ #category : #accessing }
STCEmailAddress >> printOn: aStream [
	aStream
		nextPutAll: name;
		nextPut: $@;
		nextPutAll: domain
]

{ #category : #accessing }
STCEmailAddress >> user [
	^name
]

{ #category : #accessing }
STCEmailAddress >> user: aString [
	self name: aString
]
