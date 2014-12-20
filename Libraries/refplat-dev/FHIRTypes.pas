{!Wrapper uses FHIRBase, FHIRBase_Wrapper}

unit FHIRTypes;

{
  Copyright (c) 2011+, HL7, Inc.
  All rights reserved.
  
  Redistribution and use in source and binary forms, with or without modification, 
  are permitted provided that the following conditions are met:
  
   * Redistributions of source code must retain the above copyright notice, this 
     list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above copyright notice, 
     this list of conditions and the following disclaimer in the documentation 
     and/or other materials provided with the distribution.
   * Neither the name of HL7 nor the names of its contributors may be used to 
     endorse or promote products derived from this software without specific 
     prior written permission.
  
  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
  NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
  POSSIBILITY OF SUCH DAMAGE.
  
}


{$IFDEF FHIR-DSTU}
This is the dev branch of the FHIR code
{$ENDIF}

interface

// FHIR v0.4.0 generated Sun, Dec 14, 2014 22:19+1100

uses
  Classes, SysUtils, DecimalSupport, StringSupport, AdvBuffers, DateAndTime, FHIRBase;

Type
  {@Enum TFhirNarrativeStatus
    The status of a resource narrative
  }
  TFhirNarrativeStatus = (
    NarrativeStatusNull,  {@enum.value NarrativeStatusNull Value is missing from Instance }
    NarrativeStatusGenerated, {@enum.value NarrativeStatusGenerated The contents of the narrative are entirely generated from the structured data in the resource. }
    NarrativeStatusExtensions, {@enum.value NarrativeStatusExtensions The contents of the narrative are entirely generated from the structured data in the resource and some of the content is generated from extensions. }
    NarrativeStatusAdditional, {@enum.value NarrativeStatusAdditional The contents of the narrative contain additional information not found in the structured data. }
    NarrativeStatusEmpty); {@enum.value NarrativeStatusEmpty the contents of the narrative are some equivalent of "No human-readable text provided for this resource". }
  TFhirNarrativeStatusList = set of TFhirNarrativeStatus;

  {@Enum TFhirQuantityComparator
    How the Quantity should be understood and represented
  }
  TFhirQuantityComparator = (
    QuantityComparatorNull,  {@enum.value QuantityComparatorNull Value is missing from Instance }
    QuantityComparatorLessThan, {@enum.value QuantityComparatorLessThan The actual value is less than the given value. }
    QuantityComparatorLessOrEquals, {@enum.value QuantityComparatorLessOrEquals The actual value is less than or equal to the given value. }
    QuantityComparatorGreaterOrEquals, {@enum.value QuantityComparatorGreaterOrEquals The actual value is greater than or equal to the given value. }
    QuantityComparatorGreaterThan); {@enum.value QuantityComparatorGreaterThan The actual value is greater than the given value. }
  TFhirQuantityComparatorList = set of TFhirQuantityComparator;

  {@Enum TFhirIdentifierUse
    Identifies the purpose for this identifier, if known
  }
  TFhirIdentifierUse = (
    IdentifierUseNull,  {@enum.value IdentifierUseNull Value is missing from Instance }
    IdentifierUseUsual, {@enum.value IdentifierUseUsual the identifier recommended for display and use in real-world interactions. }
    IdentifierUseOfficial, {@enum.value IdentifierUseOfficial the identifier considered to be most trusted for the identification of this item. }
    IdentifierUseTemp, {@enum.value IdentifierUseTemp A temporary identifier. }
    IdentifierUseSecondary); {@enum.value IdentifierUseSecondary An identifier that was assigned in secondary use - it serves to identify the object in a relative context, but cannot be consistently assigned to the same object again in a different context. }
  TFhirIdentifierUseList = set of TFhirIdentifierUse;

  {@Enum TFhirPropertyRepresentation
    How a property is represented on the wire
  }
  TFhirPropertyRepresentation = (
    PropertyRepresentationNull,  {@enum.value PropertyRepresentationNull Value is missing from Instance }
    PropertyRepresentationXmlAttr); {@enum.value PropertyRepresentationXmlAttr In XML, this property is represented as an attribute not an element. }
  TFhirPropertyRepresentationList = set of TFhirPropertyRepresentation;

  {@Enum TFhirResourceSlicingRules
    How slices are interpreted when evaluating an instance
  }
  TFhirResourceSlicingRules = (
    ResourceSlicingRulesNull,  {@enum.value ResourceSlicingRulesNull Value is missing from Instance }
    ResourceSlicingRulesClosed, {@enum.value ResourceSlicingRulesClosed No additional content is allowed other than that described by the slices in this profile. }
    ResourceSlicingRulesOpen, {@enum.value ResourceSlicingRulesOpen Additional content is allowed anywhere in the list. }
    ResourceSlicingRulesOpenAtEnd); {@enum.value ResourceSlicingRulesOpenAtEnd Additional content is allowed, but only at the end of the list. }
  TFhirResourceSlicingRulesList = set of TFhirResourceSlicingRules;

  {@Enum TFhirResourceAggregationMode
    How resource references can be aggregated
  }
  TFhirResourceAggregationMode = (
    ResourceAggregationModeNull,  {@enum.value ResourceAggregationModeNull Value is missing from Instance }
    ResourceAggregationModeContained, {@enum.value ResourceAggregationModeContained The reference is a local reference to a contained resource. }
    ResourceAggregationModeReferenced, {@enum.value ResourceAggregationModeReferenced The reference to a resource that has to be resolved externally to the resource that includes the reference. }
    ResourceAggregationModeBundled); {@enum.value ResourceAggregationModeBundled The resource the reference points to will be found in the same bundle as the resource that includes the reference. }
  TFhirResourceAggregationModeList = set of TFhirResourceAggregationMode;

  {@Enum TFhirConstraintSeverity
    SHALL applications comply with this constraint?
  }
  TFhirConstraintSeverity = (
    ConstraintSeverityNull,  {@enum.value ConstraintSeverityNull Value is missing from Instance }
    ConstraintSeverityError, {@enum.value ConstraintSeverityError If the constraint is violated, the resource is not conformant. }
    ConstraintSeverityWarning); {@enum.value ConstraintSeverityWarning If the constraint is violated, the resource is conformant, but it is not necessarily following best practice. }
  TFhirConstraintSeverityList = set of TFhirConstraintSeverity;

  {@Enum TFhirBindingConformance
    Binding conformance for applications
  }
  TFhirBindingConformance = (
    BindingConformanceNull,  {@enum.value BindingConformanceNull Value is missing from Instance }
    BindingConformanceRequired, {@enum.value BindingConformanceRequired Only codes in the specified set are allowed.  If the binding is extensible, other codes may be used for concepts not covered by the bound set of codes. }
    BindingConformancePreferred, {@enum.value BindingConformancePreferred For greater interoperability, implementers are strongly encouraged to use the bound set of codes, however alternate codes may be used in derived profiles and implementations if necessary without being considered non-conformant. }
    BindingConformanceExample); {@enum.value BindingConformanceExample The codes in the set are an example to illustrate the meaning of the field. There is no particular preference for its use nor any assertion that the provided values are sufficient to meet implementation needs. }
  TFhirBindingConformanceList = set of TFhirBindingConformance;

  {@Enum TFhirEventTiming
    Real world event that the schedule relates to
  }
  TFhirEventTiming = (
    EventTimingNull,  {@enum.value EventTimingNull Value is missing from Instance }
    EventTimingHS, {@enum.value EventTimingHS event occurs [duration] before the hour of sleep (or trying to). }
    EventTimingWAKE, {@enum.value EventTimingWAKE event occurs [duration] after waking. }
    EventTimingAC, {@enum.value EventTimingAC event occurs [duration] before a meal (from the Latin ante cibus). }
    EventTimingACM, {@enum.value EventTimingACM event occurs [duration] before breakfast (from the Latin ante cibus matutinus). }
    EventTimingACD, {@enum.value EventTimingACD event occurs [duration] before lunch (from the Latin ante cibus diurnus). }
    EventTimingACV, {@enum.value EventTimingACV event occurs [duration] before dinner (from the Latin ante cibus vespertinus). }
    EventTimingPC, {@enum.value EventTimingPC event occurs [duration] after a meal (from the Latin post cibus). }
    EventTimingPCM, {@enum.value EventTimingPCM event occurs [duration] after breakfast (from the Latin post cibus matutinus). }
    EventTimingPCD, {@enum.value EventTimingPCD event occurs [duration] after lunch (from the Latin post cibus diurnus). }
    EventTimingPCV); {@enum.value EventTimingPCV event occurs [duration] after dinner (from the Latin post cibus vespertinus). }
  TFhirEventTimingList = set of TFhirEventTiming;

  {@Enum TFhirUnitsOfTime
    A unit of time (units from UCUM)
  }
  TFhirUnitsOfTime = (
    UnitsOfTimeNull,  {@enum.value UnitsOfTimeNull Value is missing from Instance }
    UnitsOfTimeS, {@enum.value UnitsOfTimeS second. }
    UnitsOfTimeMin, {@enum.value UnitsOfTimeMin minute. }
    UnitsOfTimeH, {@enum.value UnitsOfTimeH hour. }
    UnitsOfTimeD, {@enum.value UnitsOfTimeD day. }
    UnitsOfTimeWk, {@enum.value UnitsOfTimeWk week. }
    UnitsOfTimeMo, {@enum.value UnitsOfTimeMo month. }
    UnitsOfTimeA); {@enum.value UnitsOfTimeA year. }
  TFhirUnitsOfTimeList = set of TFhirUnitsOfTime;

  {@Enum TFhirAddressUse
    The use of an address
  }
  TFhirAddressUse = (
    AddressUseNull,  {@enum.value AddressUseNull Value is missing from Instance }
    AddressUseHome, {@enum.value AddressUseHome A communication address at a home. }
    AddressUseWork, {@enum.value AddressUseWork An office address. First choice for business related contacts during business hours. }
    AddressUseTemp, {@enum.value AddressUseTemp A temporary address. The period can provide more detailed information. }
    AddressUseOld); {@enum.value AddressUseOld This address is no longer in use (or was never correct, but retained for records). }
  TFhirAddressUseList = set of TFhirAddressUse;

  {@Enum TFhirNameUse
    The use of a human name
  }
  TFhirNameUse = (
    NameUseNull,  {@enum.value NameUseNull Value is missing from Instance }
    NameUseUsual, {@enum.value NameUseUsual Known as/conventional/the one you normally use. }
    NameUseOfficial, {@enum.value NameUseOfficial The formal name as registered in an official (government) registry, but which name might not be commonly used. May be called "legal name". }
    NameUseTemp, {@enum.value NameUseTemp A temporary name. Name.period can provide more detailed information. This may also be used for temporary names assigned at birth or in emergency situations. }
    NameUseNickname, {@enum.value NameUseNickname A name that is used to address the person in an informal manner, but is not part of their formal or usual name. }
    NameUseAnonymous, {@enum.value NameUseAnonymous Anonymous assigned name, alias, or pseudonym (used to protect a person's identity for privacy reasons). }
    NameUseOld, {@enum.value NameUseOld This name is no longer in use (or was never correct, but retained for records). }
    NameUseMaiden); {@enum.value NameUseMaiden A name used prior to marriage. Marriage naming customs vary greatly around the world. This name use is for use by applications that collect and store "maiden" names. Though the concept of maiden name is often gender specific, the use of this term is not gender specific. The use of this term does not imply any particular history for a person's name, nor should the maiden name be determined algorithmically. }
  TFhirNameUseList = set of TFhirNameUse;

  {@Enum TFhirContactPointSystem
    Telecommunications form for contact point
  }
  TFhirContactPointSystem = (
    ContactPointSystemNull,  {@enum.value ContactPointSystemNull Value is missing from Instance }
    ContactPointSystemPhone, {@enum.value ContactPointSystemPhone The value is a telephone number used for voice calls. Use of full international numbers starting with + is recommended to enable automatic dialing support but not required. }
    ContactPointSystemFax, {@enum.value ContactPointSystemFax The value is a fax machine. Use of full international numbers starting with + is recommended to enable automatic dialing support but not required. }
    ContactPointSystemEmail, {@enum.value ContactPointSystemEmail The value is an email address. }
    ContactPointSystemUrl); {@enum.value ContactPointSystemUrl The value is a url. This is intended for various personal contacts including blogs, Twitter, Facebook, etc. Do not use for email addresses. }
  TFhirContactPointSystemList = set of TFhirContactPointSystem;

  {@Enum TFhirContactPointUse
    Use of contact point
  }
  TFhirContactPointUse = (
    ContactPointUseNull,  {@enum.value ContactPointUseNull Value is missing from Instance }
    ContactPointUseHome, {@enum.value ContactPointUseHome A communication contact point at a home; attempted contacts for business purposes might intrude privacy and chances are one will contact family or other household members instead of the person one wishes to call. Typically used with urgent cases, or if no other contacts are available. }
    ContactPointUseWork, {@enum.value ContactPointUseWork An office contact point. First choice for business related contacts during business hours. }
    ContactPointUseTemp, {@enum.value ContactPointUseTemp A temporary contact point. The period can provide more detailed information. }
    ContactPointUseOld, {@enum.value ContactPointUseOld This contact point is no longer in use (or was never correct, but retained for records). }
    ContactPointUseMobile); {@enum.value ContactPointUseMobile A telecommunication device that moves and stays with its owner. May have characteristics of all other use codes, suitable for urgent matters, not the first choice for routine business. }
  TFhirContactPointUseList = set of TFhirContactPointUse;

  {@Enum TFhirAlertStatus
    Indicates whether this alert is active and needs to be displayed to a user, or whether it is no longer needed or entered in error
  }
  TFhirAlertStatus = (
    AlertStatusNull,  {@enum.value AlertStatusNull Value is missing from Instance }
    AlertStatusActive, {@enum.value AlertStatusActive A current alert that should be displayed to a user. A system may use the category to determine which roles should view the alert. }
    AlertStatusInactive, {@enum.value AlertStatusInactive The alert does not need to be displayed any more. }
    AlertStatusEnteredInError); {@enum.value AlertStatusEnteredInError The alert was added in error, and should no longer be displayed. }
  TFhirAlertStatusList = set of TFhirAlertStatus;

  {@Enum TFhirAllergyIntoleranceStatus
    Assertion about certainty associated with a propensity, or potential risk, of a reaction to the identified Substance
  }
  TFhirAllergyIntoleranceStatus = (
    AllergyIntoleranceStatusNull,  {@enum.value AllergyIntoleranceStatusNull Value is missing from Instance }
    AllergyIntoleranceStatusUnconfirmed, {@enum.value AllergyIntoleranceStatusUnconfirmed A low level of certainty about the propensity for a reaction to the identified Substance. }
    AllergyIntoleranceStatusConfirmed, {@enum.value AllergyIntoleranceStatusConfirmed A high level of certainty about the propensity for a reaction to the identified Substance, which may include clinical evidence by testing or rechallenge. }
    AllergyIntoleranceStatusResolved, {@enum.value AllergyIntoleranceStatusResolved A reaction to the identified Substance has been clinically reassessed by testing or rechallenge and considered to be resolved. }
    AllergyIntoleranceStatusRefuted); {@enum.value AllergyIntoleranceStatusRefuted A propensity for a reaction to the identified Substance has been disproven with a high level of clinical certainty, which may include testing or rechallenge, and is refuted. }
  TFhirAllergyIntoleranceStatusList = set of TFhirAllergyIntoleranceStatus;

  {@Enum TFhirAllergyIntoleranceCriticality
    Estimate of the potential clinical harm, or seriousness, of a reaction to an identified Substance
  }
  TFhirAllergyIntoleranceCriticality = (
    AllergyIntoleranceCriticalityNull,  {@enum.value AllergyIntoleranceCriticalityNull Value is missing from Instance }
    AllergyIntoleranceCriticalityLow, {@enum.value AllergyIntoleranceCriticalityLow The potential clinical impact of a future reaction is estimated as low risk: exposure to substance is unlikely to result in a life threatening or organ system threatening outcome. Future exposure to the Substance is considered a relative contra-indication. }
    AllergyIntoleranceCriticalityHigh, {@enum.value AllergyIntoleranceCriticalityHigh The potential clinical impact of a future reaction is estimated as high risk: exposure to substance may result in a life threatening or organ system threatening outcome. Future exposure to the Substance may be considered an absolute contra-indication. }
    AllergyIntoleranceCriticalityUnassessible); {@enum.value AllergyIntoleranceCriticalityUnassessible Unable to assess the potential clinical impact with the information available. }
  TFhirAllergyIntoleranceCriticalityList = set of TFhirAllergyIntoleranceCriticality;

  {@Enum TFhirAllergyIntoleranceType
    Identification of the underlying physiological mechanism for a Reaction Risk
  }
  TFhirAllergyIntoleranceType = (
    AllergyIntoleranceTypeNull,  {@enum.value AllergyIntoleranceTypeNull Value is missing from Instance }
    AllergyIntoleranceTypeImmune, {@enum.value AllergyIntoleranceTypeImmune Immune mediated reaction, including allergic reactions and hypersensitivities. }
    AllergyIntoleranceTypeNonImmune); {@enum.value AllergyIntoleranceTypeNonImmune A non-immune mediated reaction, which can include pseudoallergic reactions, side effects, intolerances, drug toxicities (eg to Gentamicin), drug-drug interactions, food-drug interactions, and drug-disease interactions. }
  TFhirAllergyIntoleranceTypeList = set of TFhirAllergyIntoleranceType;

  {@Enum TFhirAllergyIntoleranceCategory
    Category of an identified Substance
  }
  TFhirAllergyIntoleranceCategory = (
    AllergyIntoleranceCategoryNull,  {@enum.value AllergyIntoleranceCategoryNull Value is missing from Instance }
    AllergyIntoleranceCategoryFood, {@enum.value AllergyIntoleranceCategoryFood Any substance consumed to provide nutritional support for the body. }
    AllergyIntoleranceCategoryMedication, {@enum.value AllergyIntoleranceCategoryMedication Substances administered to achieve a physiological effect. }
    AllergyIntoleranceCategoryEnvironment); {@enum.value AllergyIntoleranceCategoryEnvironment Substances that are encountered in the environment. }
  TFhirAllergyIntoleranceCategoryList = set of TFhirAllergyIntoleranceCategory;

  {@Enum TFhirReactionEventCertainty
    Statement about the degree of clinical certainty that a Specific Substance was the cause of the Manifestation in an reaction event
  }
  TFhirReactionEventCertainty = (
    ReactionEventCertaintyNull,  {@enum.value ReactionEventCertaintyNull Value is missing from Instance }
    ReactionEventCertaintyUnlikely, {@enum.value ReactionEventCertaintyUnlikely There is a low level of clinical certainty that the reaction was caused by the identified Substance. }
    ReactionEventCertaintyLikely, {@enum.value ReactionEventCertaintyLikely There is a high level of clinical certainty that the reaction was caused by the identified Substance. }
    ReactionEventCertaintyConfirmed); {@enum.value ReactionEventCertaintyConfirmed There is a very high level of clinical certainty that the reaction was due to the identified Substance, which may include clinical evidence by testing or rechallenge. }
  TFhirReactionEventCertaintyList = set of TFhirReactionEventCertainty;

  {@Enum TFhirReactionEventSeverity
    Clinical assessment of the severity of a reaction event as a whole, potentially considering multiple different manifestations
  }
  TFhirReactionEventSeverity = (
    ReactionEventSeverityNull,  {@enum.value ReactionEventSeverityNull Value is missing from Instance }
    ReactionEventSeverityMild, {@enum.value ReactionEventSeverityMild Causes mild physiological effects. }
    ReactionEventSeverityModerate, {@enum.value ReactionEventSeverityModerate Causes moderate physiological effects. }
    ReactionEventSeveritySevere); {@enum.value ReactionEventSeveritySevere Causes severe physiological effects. }
  TFhirReactionEventSeverityList = set of TFhirReactionEventSeverity;

  {@Enum TFhirAppointmentstatus
    The free/busy status of an appointment
  }
  TFhirAppointmentstatus = (
    AppointmentstatusNull,  {@enum.value AppointmentstatusNull Value is missing from Instance }
    AppointmentstatusPending, {@enum.value AppointmentstatusPending Some or all of the participant(s) have not finalized their acceptance of the appointment request. }
    AppointmentstatusBooked, {@enum.value AppointmentstatusBooked All participant(s) have been considered and the appointment is condirmed to go ahead at the date/times specified. }
    AppointmentstatusArrived, {@enum.value AppointmentstatusArrived Some of the patients have arrived. }
    AppointmentstatusFulfilled, {@enum.value AppointmentstatusFulfilled This appointment has completed and may have resulted in an encounter. }
    AppointmentstatusCancelled, {@enum.value AppointmentstatusCancelled The appointment has been cancelled. }
    AppointmentstatusNoshow); {@enum.value AppointmentstatusNoshow Some or all of the participant(s) have not/did not appear for the appointment (usually the patient). }
  TFhirAppointmentstatusList = set of TFhirAppointmentstatus;

  {@Enum TFhirParticipantrequired
    Is the Participant required to attend the appointment
  }
  TFhirParticipantrequired = (
    ParticipantrequiredNull,  {@enum.value ParticipantrequiredNull Value is missing from Instance }
    ParticipantrequiredRequired, {@enum.value ParticipantrequiredRequired The participant is required to attend the appointment. }
    ParticipantrequiredOptional, {@enum.value ParticipantrequiredOptional The participant may optionally attend the appointment. }
    ParticipantrequiredInformationOnly); {@enum.value ParticipantrequiredInformationOnly The participant is not required to attend the appointment (appointment is about them, not for them). }
  TFhirParticipantrequiredList = set of TFhirParticipantrequired;

  {@Enum TFhirParticipationstatus
    The Participation status of an appointment
  }
  TFhirParticipationstatus = (
    ParticipationstatusNull,  {@enum.value ParticipationstatusNull Value is missing from Instance }
    ParticipationstatusAccepted, {@enum.value ParticipationstatusAccepted The participant has accepted the appointment. }
    ParticipationstatusDeclined, {@enum.value ParticipationstatusDeclined The participant has declined the appointment and will not participate in the appointment. }
    ParticipationstatusTentative, {@enum.value ParticipationstatusTentative The participant has  tentatively accepted the appointment. This could be automatically created by a system and requires further processing before it can be accepted. There is no commitment that attendance will occur. }
    ParticipationstatusInProcess, {@enum.value ParticipationstatusInProcess The participant has started the appointment. }
    ParticipationstatusCompleted, {@enum.value ParticipationstatusCompleted The participant's involvement in the appointment has been completed. }
    ParticipationstatusNeedsAction); {@enum.value ParticipationstatusNeedsAction The participant needs to indicate if they accept the appointment by changing this status to one of the other statuses. }
  TFhirParticipationstatusList = set of TFhirParticipationstatus;

  {@Enum TFhirParticipantstatus
    The Participation status of an appointment
  }
  TFhirParticipantstatus = (
    ParticipantstatusNull,  {@enum.value ParticipantstatusNull Value is missing from Instance }
    ParticipantstatusAccepted, {@enum.value ParticipantstatusAccepted The appointment participant has accepted that they can attend the appointment at the time specified in the AppointmentResponse. }
    ParticipantstatusDeclined, {@enum.value ParticipantstatusDeclined The appointment participant has declined the appointment. }
    ParticipantstatusTentative, {@enum.value ParticipantstatusTentative The appointment participant has tentatively accepted the appointment. }
    ParticipantstatusInProcess, {@enum.value ParticipantstatusInProcess The participant has in-process the appointment. }
    ParticipantstatusCompleted, {@enum.value ParticipantstatusCompleted The participant has completed the appointment. }
    ParticipantstatusNeedsAction); {@enum.value ParticipantstatusNeedsAction This is the intitial status of an appointment participant until a participant has replied. It implies that there is no commitment for the appointment. }
  TFhirParticipantstatusList = set of TFhirParticipantstatus;

  {@Enum TFhirBundleType
    Indicates the purpose of a bundle- how it was intended to be used
  }
  TFhirBundleType = (
    BundleTypeNull,  {@enum.value BundleTypeNull Value is missing from Instance }
    BundleTypeDocument, {@enum.value BundleTypeDocument The bundle is a document. The first resource is a Composition. }
    BundleTypeMessage, {@enum.value BundleTypeMessage The bundle is a message. The first resource is a MessageHeader. }
    BundleTypeTransaction, {@enum.value BundleTypeTransaction The bundle is a transaction - intended to be processed by a server as an atomic commit. }
    BundleTypeTransactionResponse, {@enum.value BundleTypeTransactionResponse The bundle is a transaction response. }
    BundleTypeHistory, {@enum.value BundleTypeHistory The bundle is a list of resources from a _history interaction on a server. }
    BundleTypeSearchset, {@enum.value BundleTypeSearchset The bundle is a list of resources returned as a result of a search/query interaction, operation, or message. }
    BundleTypeCollection); {@enum.value BundleTypeCollection The bundle is a set of resources collected into a single document for ease of distribution. }
  TFhirBundleTypeList = set of TFhirBundleType;

  {@Enum TFhirBundleEntryStatus
    The status of a resource in the bundle. Used for search (to differentiate between resources included as a match, and resources included as an _include), and for transactions (create/update/delete)
  }
  TFhirBundleEntryStatus = (
    BundleEntryStatusNull,  {@enum.value BundleEntryStatusNull Value is missing from Instance }
    BundleEntryStatusCreate, {@enum.value BundleEntryStatusCreate Transaction: perform a create operation on this resource. }
    BundleEntryStatusUpdate, {@enum.value BundleEntryStatusUpdate Transaction: perform an update operation on this resource. }
    BundleEntryStatusMatch, {@enum.value BundleEntryStatusMatch Transaction: look for this resource using the search url provided. If there's no match, create it. Search: this resource is returned because it matches the search criteria. }
    BundleEntryStatusInclude); {@enum.value BundleEntryStatusInclude Search: this resource is returned because it meets an _include criteria. }
  TFhirBundleEntryStatusList = set of TFhirBundleEntryStatus;

  {@Enum TFhirCarePlanStatus
    Indicates whether the plan is currently being acted upon, represents future intentions or is now just historical record.
  }
  TFhirCarePlanStatus = (
    CarePlanStatusNull,  {@enum.value CarePlanStatusNull Value is missing from Instance }
    CarePlanStatusPlanned, {@enum.value CarePlanStatusPlanned The plan is in development or awaiting use but is not yet intended to be acted upon. }
    CarePlanStatusActive, {@enum.value CarePlanStatusActive The plan is intended to be followed and used as part of patient care. }
    CarePlanStatusCompleted); {@enum.value CarePlanStatusCompleted The plan is no longer in use and is not expected to be followed or used in patient care. }
  TFhirCarePlanStatusList = set of TFhirCarePlanStatus;

  {@Enum TFhirCarePlanGoalStatus
    Indicates whether the goal has been met and is still being targeted
  }
  TFhirCarePlanGoalStatus = (
    CarePlanGoalStatusNull,  {@enum.value CarePlanGoalStatusNull Value is missing from Instance }
    CarePlanGoalStatusInProgress, {@enum.value CarePlanGoalStatusInProgress The goal is being sought but has not yet been reached.  (Also applies if goal was reached in the past but there has been regression and goal is being sought again). }
    CarePlanGoalStatusAchieved, {@enum.value CarePlanGoalStatusAchieved The goal has been met and no further action is needed. }
    CarePlanGoalStatusSustaining, {@enum.value CarePlanGoalStatusSustaining The goal has been met, but ongoing activity is needed to sustain the goal objective. }
    CarePlanGoalStatusCancelled); {@enum.value CarePlanGoalStatusCancelled The goal is no longer being sought. }
  TFhirCarePlanGoalStatusList = set of TFhirCarePlanGoalStatus;

  {@Enum TFhirCarePlanActivityStatus
    Indicates where the activity is at in its overall life cycle
  }
  TFhirCarePlanActivityStatus = (
    CarePlanActivityStatusNull,  {@enum.value CarePlanActivityStatusNull Value is missing from Instance }
    CarePlanActivityStatusNotStarted, {@enum.value CarePlanActivityStatusNotStarted Activity is planned but no action has yet been taken. }
    CarePlanActivityStatusScheduled, {@enum.value CarePlanActivityStatusScheduled Appointment or other booking has occurred but activity has not yet begun. }
    CarePlanActivityStatusInProgress, {@enum.value CarePlanActivityStatusInProgress Activity has been started but is not yet complete. }
    CarePlanActivityStatusOnHold, {@enum.value CarePlanActivityStatusOnHold Activity was started but has temporarily ceased with an expectation of resumption at a future time. }
    CarePlanActivityStatusCompleted, {@enum.value CarePlanActivityStatusCompleted The activities have been completed (more or less) as planned. }
    CarePlanActivityStatusCancelled); {@enum.value CarePlanActivityStatusCancelled The activities have been ended prior to completion (perhaps even before they were started). }
  TFhirCarePlanActivityStatusList = set of TFhirCarePlanActivityStatus;

  {@Enum TFhirCarePlanActivityCategory
    High-level categorization of the type of activity in a care plan.
  }
  TFhirCarePlanActivityCategory = (
    CarePlanActivityCategoryNull,  {@enum.value CarePlanActivityCategoryNull Value is missing from Instance }
    CarePlanActivityCategoryDiet, {@enum.value CarePlanActivityCategoryDiet Plan for the patient to consume food of a specified nature. }
    CarePlanActivityCategoryDrug, {@enum.value CarePlanActivityCategoryDrug Plan for the patient to consume/receive a drug, vaccine or other product. }
    CarePlanActivityCategoryEncounter, {@enum.value CarePlanActivityCategoryEncounter Plan to meet or communicate with the patient (in-patient, out-patient, phone call, etc.). }
    CarePlanActivityCategoryObservation, {@enum.value CarePlanActivityCategoryObservation Plan to capture information about a patient (vitals, labs, diagnostic images, etc.). }
    CarePlanActivityCategoryProcedure, {@enum.value CarePlanActivityCategoryProcedure Plan to modify the patient in some way (surgery, physiotherapy, education, counseling, etc.). }
    CarePlanActivityCategorySupply, {@enum.value CarePlanActivityCategorySupply Plan to provide something to the patient (medication, medical supply, etc.). }
    CarePlanActivityCategoryOther); {@enum.value CarePlanActivityCategoryOther Some other form of action. }
  TFhirCarePlanActivityCategoryList = set of TFhirCarePlanActivityCategory;

  {@Enum TFhirCarePlan2Status
    Indicates whether the plan is currently being acted upon, represents future intentions or is now just historical record.
  }
  TFhirCarePlan2Status = (
    CarePlan2StatusNull,  {@enum.value CarePlan2StatusNull Value is missing from Instance }
    CarePlan2StatusPlanned, {@enum.value CarePlan2StatusPlanned The plan is in development or awaiting use but is not yet intended to be acted upon. }
    CarePlan2StatusActive, {@enum.value CarePlan2StatusActive The plan is intended to be followed and used as part of patient care. }
    CarePlan2StatusCompleted); {@enum.value CarePlan2StatusCompleted The plan is no longer in use and is not expected to be followed or used in patient care. }
  TFhirCarePlan2StatusList = set of TFhirCarePlan2Status;

  {@Enum TFhirRSLink
    The outcome of the processing.
  }
  TFhirRSLink = (
    RSLinkNull,  {@enum.value RSLinkNull Value is missing from Instance }
    RSLinkComplete, {@enum.value RSLinkComplete The processing completed without errors. }
    RSLinkError); {@enum.value RSLinkError The processing identified with errors. }
  TFhirRSLinkList = set of TFhirRSLink;

  {@Enum TFhirCommunicationStatus
    The status of the communication
  }
  TFhirCommunicationStatus = (
    CommunicationStatusNull,  {@enum.value CommunicationStatusNull Value is missing from Instance }
    CommunicationStatusInProgress, {@enum.value CommunicationStatusInProgress The communication transmission is ongoing. }
    CommunicationStatusCompleted, {@enum.value CommunicationStatusCompleted The message transmission is complete, i.e., delivered to the recipient's destination. }
    CommunicationStatusSuspended, {@enum.value CommunicationStatusSuspended The communication transmission has been held by originating system/user request. }
    CommunicationStatusRejected, {@enum.value CommunicationStatusRejected The receiving system has declined to accept the message. }
    CommunicationStatusFailed); {@enum.value CommunicationStatusFailed There was a failure in transmitting the message out. }
  TFhirCommunicationStatusList = set of TFhirCommunicationStatus;

  {@Enum TFhirCommunicationRequestStatus
    The status of the communication
  }
  TFhirCommunicationRequestStatus = (
    CommunicationRequestStatusNull,  {@enum.value CommunicationRequestStatusNull Value is missing from Instance }
    CommunicationRequestStatusProposed, {@enum.value CommunicationRequestStatusProposed The request has been proposed. }
    CommunicationRequestStatusPlanned, {@enum.value CommunicationRequestStatusPlanned The request has been planned. }
    CommunicationRequestStatusRequested, {@enum.value CommunicationRequestStatusRequested The request has been placed. }
    CommunicationRequestStatusReceived, {@enum.value CommunicationRequestStatusReceived The receiving system has received the request but not yet decided whether it will be performed. }
    CommunicationRequestStatusAccepted, {@enum.value CommunicationRequestStatusAccepted The receiving system has accepted the order, but work has not yet commenced. }
    CommunicationRequestStatusInProgress, {@enum.value CommunicationRequestStatusInProgress The work to fulfill the order is happening. }
    CommunicationRequestStatusCompleted, {@enum.value CommunicationRequestStatusCompleted The work has been complete, the report(s) released, and no further work is planned. }
    CommunicationRequestStatusSuspended, {@enum.value CommunicationRequestStatusSuspended The request has been held by originating system/user request. }
    CommunicationRequestStatusRejected, {@enum.value CommunicationRequestStatusRejected The receiving system has declined to fulfill the request. }
    CommunicationRequestStatusFailed); {@enum.value CommunicationRequestStatusFailed The communication was attempted, but due to some procedural error, it could not be completed. }
  TFhirCommunicationRequestStatusList = set of TFhirCommunicationRequestStatus;

  {@Enum TFhirCompositionStatus
    The workflow/clinical status of the composition
  }
  TFhirCompositionStatus = (
    CompositionStatusNull,  {@enum.value CompositionStatusNull Value is missing from Instance }
    CompositionStatusPreliminary, {@enum.value CompositionStatusPreliminary This is a preliminary composition or document (also known as initial or interim). The content may be incomplete or unverified. }
    CompositionStatusFinal, {@enum.value CompositionStatusFinal The composition or document is complete and verified by an appropriate person, and no further work is planned. }
    CompositionStatusAppended, {@enum.value CompositionStatusAppended The composition or document has been modified subsequent to being released as "final", and is complete and verified by an authorized person. The modifications added new information to the composition or document, but did not revise existing content. }
    CompositionStatusAmended, {@enum.value CompositionStatusAmended The composition or document has been modified subsequent to being released as "final", and is complete and verified by an authorized person. }
    CompositionStatusEnteredInError); {@enum.value CompositionStatusEnteredInError The composition or document was originally created/issued in error, and this is an amendment that marks that the entire series should not be considered as valid. }
  TFhirCompositionStatusList = set of TFhirCompositionStatus;

  {@Enum TFhirCompositionAttestationMode
    The way in which a person authenticated a composition
  }
  TFhirCompositionAttestationMode = (
    CompositionAttestationModeNull,  {@enum.value CompositionAttestationModeNull Value is missing from Instance }
    CompositionAttestationModePersonal, {@enum.value CompositionAttestationModePersonal The person authenticated the content in their personal capacity. }
    CompositionAttestationModeProfessional, {@enum.value CompositionAttestationModeProfessional The person authenticated the content in their professional capacity. }
    CompositionAttestationModeLegal, {@enum.value CompositionAttestationModeLegal The person authenticated the content and accepted legal responsibility for its content. }
    CompositionAttestationModeOfficial); {@enum.value CompositionAttestationModeOfficial The organization authenticated the content as consistent with their policies and procedures. }
  TFhirCompositionAttestationModeList = set of TFhirCompositionAttestationMode;

  {@Enum TFhirValuesetStatus
    The lifecycle status of a Value Set or Concept Map
  }
  TFhirValuesetStatus = (
    ValuesetStatusNull,  {@enum.value ValuesetStatusNull Value is missing from Instance }
    ValuesetStatusDraft, {@enum.value ValuesetStatusDraft This valueset is still under development. }
    ValuesetStatusActive, {@enum.value ValuesetStatusActive This valueset is ready for normal use. }
    ValuesetStatusRetired); {@enum.value ValuesetStatusRetired This valueset has been withdrawn or superceded and should no longer be used. }
  TFhirValuesetStatusList = set of TFhirValuesetStatus;

  {@Enum TFhirConceptEquivalence
    The degree of equivalence between concepts
  }
  TFhirConceptEquivalence = (
    ConceptEquivalenceNull,  {@enum.value ConceptEquivalenceNull Value is missing from Instance }
    ConceptEquivalenceEquivalent, {@enum.value ConceptEquivalenceEquivalent The definitions of the concepts mean the same thing (including when structural implications of meaning are considered) (i.e. extensionally identical). }
    ConceptEquivalenceEqual, {@enum.value ConceptEquivalenceEqual The definitions of the concepts are exactly the same (i.e. only grammatical differences) and structural implications of meaning are identifical or irrelevant (i.e. intensionally identical). }
    ConceptEquivalenceWider, {@enum.value ConceptEquivalenceWider The target mapping is wider in meaning than the source concept. }
    ConceptEquivalenceSubsumes, {@enum.value ConceptEquivalenceSubsumes The target mapping subsumes the meaning of the source concept (e.g. the source is-a target). }
    ConceptEquivalenceNarrower, {@enum.value ConceptEquivalenceNarrower The target mapping is narrower in meaning that the source concept. The sense in which the mapping is narrower SHALL be described in the comments in this case, and applications should be careful when atempting to use these mappings operationally. }
    ConceptEquivalenceSpecialises, {@enum.value ConceptEquivalenceSpecialises The target mapping specialises the meaning of the source concept (e.g. the target is-a source). }
    ConceptEquivalenceInexact, {@enum.value ConceptEquivalenceInexact The target mapping overlaps with the source concept, but both source and target cover additional meaning, or the definitions are imprecise and it is uncertain whether they have the same boundaries to their meaning. The sense in which the mapping is narrower SHALL be described in the comments in this case, and applications should be careful when atempting to use these mappings operationally. }
    ConceptEquivalenceUnmatched, {@enum.value ConceptEquivalenceUnmatched There is no match for this concept in the destination concept system. }
    ConceptEquivalenceDisjoint); {@enum.value ConceptEquivalenceDisjoint This is an explicit assertion that there is no mapping between the source and target concept. }
  TFhirConceptEquivalenceList = set of TFhirConceptEquivalence;

  {@Enum TFhirConditionStatus
    The clinical status of the Condition or diagnosis
  }
  TFhirConditionStatus = (
    ConditionStatusNull,  {@enum.value ConditionStatusNull Value is missing from Instance }
    ConditionStatusProvisional, {@enum.value ConditionStatusProvisional This is a tentative diagnosis - still a candidate that is under consideration. }
    ConditionStatusWorking, {@enum.value ConditionStatusWorking The patient is being treated on the basis that this is the condition, but it is still not confirmed. }
    ConditionStatusConfirmed, {@enum.value ConditionStatusConfirmed There is sufficient diagnostic and/or clinical evidence to treat this as a confirmed condition. }
    ConditionStatusRefuted); {@enum.value ConditionStatusRefuted This condition has been ruled out by diagnostic and clinical evidence. }
  TFhirConditionStatusList = set of TFhirConditionStatus;

  {@Enum TFhirConformanceStatementStatus
    The status of this conformance statement
  }
  TFhirConformanceStatementStatus = (
    ConformanceStatementStatusNull,  {@enum.value ConformanceStatementStatusNull Value is missing from Instance }
    ConformanceStatementStatusDraft, {@enum.value ConformanceStatementStatusDraft This conformance statement is still under development. }
    ConformanceStatementStatusActive, {@enum.value ConformanceStatementStatusActive This conformance statement is ready for use in production systems. }
    ConformanceStatementStatusRetired); {@enum.value ConformanceStatementStatusRetired This conformance statement has been withdrawn or superceded and should no longer be used. }
  TFhirConformanceStatementStatusList = set of TFhirConformanceStatementStatus;

  {@Enum TFhirRestfulConformanceMode
    The mode of a RESTful conformance statement
  }
  TFhirRestfulConformanceMode = (
    RestfulConformanceModeNull,  {@enum.value RestfulConformanceModeNull Value is missing from Instance }
    RestfulConformanceModeClient, {@enum.value RestfulConformanceModeClient The application acts as a server for this resource. }
    RestfulConformanceModeServer); {@enum.value RestfulConformanceModeServer The application acts as a client for this resource. }
  TFhirRestfulConformanceModeList = set of TFhirRestfulConformanceMode;

  {@Enum TFhirTypeRestfulInteraction
    Operations supported by REST at the type or instance level
  }
  TFhirTypeRestfulInteraction = (
    TypeRestfulInteractionNull,  {@enum.value TypeRestfulInteractionNull Value is missing from Instance }
    TypeRestfulInteractionRead, {@enum.value TypeRestfulInteractionRead  }
    TypeRestfulInteractionVread, {@enum.value TypeRestfulInteractionVread  }
    TypeRestfulInteractionUpdate, {@enum.value TypeRestfulInteractionUpdate  }
    TypeRestfulInteractionDelete, {@enum.value TypeRestfulInteractionDelete  }
    TypeRestfulInteractionHistoryInstance, {@enum.value TypeRestfulInteractionHistoryInstance  }
    TypeRestfulInteractionValidate, {@enum.value TypeRestfulInteractionValidate  }
    TypeRestfulInteractionHistoryType, {@enum.value TypeRestfulInteractionHistoryType  }
    TypeRestfulInteractionCreate, {@enum.value TypeRestfulInteractionCreate  }
    TypeRestfulInteractionSearchType); {@enum.value TypeRestfulInteractionSearchType  }
  TFhirTypeRestfulInteractionList = set of TFhirTypeRestfulInteraction;

  {@Enum TFhirVersioningPolicy
    How the system supports versioning for a resource
  }
  TFhirVersioningPolicy = (
    VersioningPolicyNull,  {@enum.value VersioningPolicyNull Value is missing from Instance }
    VersioningPolicyNoVersion, {@enum.value VersioningPolicyNoVersion VersionId meta-property is not suppoerted (server) or used (client). }
    VersioningPolicyVersioned, {@enum.value VersioningPolicyVersioned VersionId meta-property is suppoerted (server) or used (client). }
    VersioningPolicyVersionedUpdate); {@enum.value VersioningPolicyVersionedUpdate VersionId is must be correct for updates (server) or will be specified (If-match header) for updates (client). }
  TFhirVersioningPolicyList = set of TFhirVersioningPolicy;

  {@Enum TFhirSearchParamType
    Data types allowed to be used for search parameters
  }
  TFhirSearchParamType = (
    SearchParamTypeNull,  {@enum.value SearchParamTypeNull Value is missing from Instance }
    SearchParamTypeNumber, {@enum.value SearchParamTypeNumber Search parameter SHALL be a number (a whole number, or a decimal). }
    SearchParamTypeDate, {@enum.value SearchParamTypeDate Search parameter is on a date/time. The date format is the standard XML format, though other formats may be supported. }
    SearchParamTypeString, {@enum.value SearchParamTypeString Search parameter is a simple string, like a name part. Search is case-insensitive and accent-insensitive. May match just the start of a string. String parameters may contain spaces. }
    SearchParamTypeToken, {@enum.value SearchParamTypeToken Search parameter on a coded element or identifier. May be used to search through the text, displayname, code and code/codesystem (for codes) and label, system and key (for identifier). Its value is either a string or a pair of namespace and value, separated by a "|", depending on the modifier used. }
    SearchParamTypeReference, {@enum.value SearchParamTypeReference A reference to another resource. }
    SearchParamTypeComposite, {@enum.value SearchParamTypeComposite A composite search parameter that combines a search on two values together. }
    SearchParamTypeQuantity); {@enum.value SearchParamTypeQuantity A search parameter that searches on a quantity. }
  TFhirSearchParamTypeList = set of TFhirSearchParamType;

  {@Enum TFhirSystemRestfulInteraction
    Operations supported by REST at the system level
  }
  TFhirSystemRestfulInteraction = (
    SystemRestfulInteractionNull,  {@enum.value SystemRestfulInteractionNull Value is missing from Instance }
    SystemRestfulInteractionTransaction, {@enum.value SystemRestfulInteractionTransaction  }
    SystemRestfulInteractionSearchSystem, {@enum.value SystemRestfulInteractionSearchSystem  }
    SystemRestfulInteractionHistorySystem); {@enum.value SystemRestfulInteractionHistorySystem  }
  TFhirSystemRestfulInteractionList = set of TFhirSystemRestfulInteraction;

  {@Enum TFhirMessageSignificanceCategory
    The impact of the content of a message
  }
  TFhirMessageSignificanceCategory = (
    MessageSignificanceCategoryNull,  {@enum.value MessageSignificanceCategoryNull Value is missing from Instance }
    MessageSignificanceCategoryConsequence, {@enum.value MessageSignificanceCategoryConsequence The message represents/requests a change that should not be processed more than once. E.g. Making a booking for an appointment. }
    MessageSignificanceCategoryCurrency, {@enum.value MessageSignificanceCategoryCurrency The message represents a response to query for current information. Retrospective processing is wrong and/or wasteful. }
    MessageSignificanceCategoryNotification); {@enum.value MessageSignificanceCategoryNotification The content is not necessarily intended to be current, and it can be reprocessed, though there may be version issues created by processing old notifications. }
  TFhirMessageSignificanceCategoryList = set of TFhirMessageSignificanceCategory;

  {@Enum TFhirMessageConformanceEventMode
    The mode of a message conformance statement
  }
  TFhirMessageConformanceEventMode = (
    MessageConformanceEventModeNull,  {@enum.value MessageConformanceEventModeNull Value is missing from Instance }
    MessageConformanceEventModeSender, {@enum.value MessageConformanceEventModeSender The application sends requests and receives responses. }
    MessageConformanceEventModeReceiver); {@enum.value MessageConformanceEventModeReceiver The application receives requests and sends responses. }
  TFhirMessageConformanceEventModeList = set of TFhirMessageConformanceEventMode;

  {@Enum TFhirDocumentMode
    Whether the application produces or consumes documents
  }
  TFhirDocumentMode = (
    DocumentModeNull,  {@enum.value DocumentModeNull Value is missing from Instance }
    DocumentModeProducer, {@enum.value DocumentModeProducer The application produces documents of the specified type. }
    DocumentModeConsumer); {@enum.value DocumentModeConsumer The application consumes documents of the specified type. }
  TFhirDocumentModeList = set of TFhirDocumentMode;

  {@Enum TFhirResourceObservationDefStatus
    The lifecycle status of a Resource data element
  }
  TFhirResourceObservationDefStatus = (
    ResourceObservationDefStatusNull,  {@enum.value ResourceObservationDefStatusNull Value is missing from Instance }
    ResourceObservationDefStatusDraft, {@enum.value ResourceObservationDefStatusDraft This data element is still under development. }
    ResourceObservationDefStatusActive, {@enum.value ResourceObservationDefStatusActive This data element is ready for normal use. }
    ResourceObservationDefStatusRetired); {@enum.value ResourceObservationDefStatusRetired This data element has been deprecated, withdrawn or superseded and should no longer be used. }
  TFhirResourceObservationDefStatusList = set of TFhirResourceObservationDefStatus;

  {@Enum TFhirDataelementGranularity
    Indicates the degree of precision of the data element definition
  }
  TFhirDataelementGranularity = (
    DataelementGranularityNull,  {@enum.value DataelementGranularityNull Value is missing from Instance }
    DataelementGranularityComparable, {@enum.value DataelementGranularityComparable The data element is sufficiently well-constrained that multiple pieces of data captured according to the constraints of the data element will be comparable (though in some cases, a degree of automated conversion/normalization may be required). }
    DataelementGranularityFullySpecified, {@enum.value DataelementGranularityFullySpecified The data element is fully specified down to a single value set, single unit of measure, single data type, etc.  Multiple pieces of data associated with this data element are fully compareable. }
    DataelementGranularityEquivalent, {@enum.value DataelementGranularityEquivalent The data element allows multiple units of measure having equivalent meaning.  E.g. "cc" (cubic centimeter) and "mL". }
    DataelementGranularityConvertable, {@enum.value DataelementGranularityConvertable The data element allows multiple units of measure that are convertable between each other (e.g. Inches and centimeters) and/or allows data to be captured in multiple value sets for which a known mapping exists allowing conversion of meaning. }
    DataelementGranularityScaleable, {@enum.value DataelementGranularityScaleable A convertable data element where unit conversions are different only by a power of 10.  E.g. g, mg, kg. }
    DataelementGranularityFlexible); {@enum.value DataelementGranularityFlexible The data element is unconstrained in units, choice of data types and/or choice of vocabulary such that automated comparison of data captured using the data element is not possible. }
  TFhirDataelementGranularityList = set of TFhirDataelementGranularity;

  {@Enum TFhirMeasurementPrinciple
    Different measurement principle supported by the device
  }
  TFhirMeasurementPrinciple = (
    MeasurementPrincipleNull,  {@enum.value MeasurementPrincipleNull Value is missing from Instance }
    MeasurementPrincipleOther, {@enum.value MeasurementPrincipleOther Measurement principle isn't in the list. }
    MeasurementPrincipleChemical, {@enum.value MeasurementPrincipleChemical Measurement is done using chemical. }
    MeasurementPrincipleElectrical, {@enum.value MeasurementPrincipleElectrical Measurement is done using electrical. }
    MeasurementPrincipleImpedance, {@enum.value MeasurementPrincipleImpedance Measurement is done using impedance. }
    MeasurementPrincipleNuclear, {@enum.value MeasurementPrincipleNuclear Measurement is done using nuclear. }
    MeasurementPrincipleOptical, {@enum.value MeasurementPrincipleOptical Measurement is done using optical. }
    MeasurementPrincipleThermal, {@enum.value MeasurementPrincipleThermal Measurement is done using thermal. }
    MeasurementPrincipleBiological, {@enum.value MeasurementPrincipleBiological Measurement is done using biological. }
    MeasurementPrincipleMechanical, {@enum.value MeasurementPrincipleMechanical Measurement is done using mechanical. }
    MeasurementPrincipleAcoustical, {@enum.value MeasurementPrincipleAcoustical Measurement is done using acoustical. }
    MeasurementPrincipleManual); {@enum.value MeasurementPrincipleManual Measurement is done using manual. }
  TFhirMeasurementPrincipleList = set of TFhirMeasurementPrinciple;

  {@Enum TFhirMetricOperationalStatus
    Describes the operational status of the DeviceMetric
  }
  TFhirMetricOperationalStatus = (
    MetricOperationalStatusNull,  {@enum.value MetricOperationalStatusNull Value is missing from Instance }
    MetricOperationalStatusOn, {@enum.value MetricOperationalStatusOn The DeviceMetric is operating and will generate DeviceObservations. }
    MetricOperationalStatusOff, {@enum.value MetricOperationalStatusOff The DeviceMetric is not operating. }
    MetricOperationalStatusStandby); {@enum.value MetricOperationalStatusStandby The DeviceMetric is operating, but will not generate any DeviceObservations. }
  TFhirMetricOperationalStatusList = set of TFhirMetricOperationalStatus;

  {@Enum TFhirMetricCategory
    Describes the category of the metric
  }
  TFhirMetricCategory = (
    MetricCategoryNull,  {@enum.value MetricCategoryNull Value is missing from Instance }
    MetricCategoryMeasurement, {@enum.value MetricCategoryMeasurement DeviceObservations generated for this DeviceMetric are measured. }
    MetricCategorySetting, {@enum.value MetricCategorySetting DeviceObservations generated for this DeviceMetric is a setting that will influence the behavior of the Device. }
    MetricCategoryCalculation, {@enum.value MetricCategoryCalculation DeviceObservations generated for this DeviceMetric are calculated. }
    MetricCategoryUnspecified); {@enum.value MetricCategoryUnspecified The category of this DeviceMetric is unspecified. }
  TFhirMetricCategoryList = set of TFhirMetricCategory;

  {@Enum TFhirMetricCalibrationType
    Describes the type of a metric calibration
  }
  TFhirMetricCalibrationType = (
    MetricCalibrationTypeNull,  {@enum.value MetricCalibrationTypeNull Value is missing from Instance }
    MetricCalibrationTypeUnspecified, {@enum.value MetricCalibrationTypeUnspecified TODO. }
    MetricCalibrationTypeOffset, {@enum.value MetricCalibrationTypeOffset TODO. }
    MetricCalibrationTypeGain, {@enum.value MetricCalibrationTypeGain TODO. }
    MetricCalibrationTypeTwoPoint); {@enum.value MetricCalibrationTypeTwoPoint TODO. }
  TFhirMetricCalibrationTypeList = set of TFhirMetricCalibrationType;

  {@Enum TFhirMetricCalibrationState
    Describes the state of a metric calibration
  }
  TFhirMetricCalibrationState = (
    MetricCalibrationStateNull,  {@enum.value MetricCalibrationStateNull Value is missing from Instance }
    MetricCalibrationStateNotCalibrated, {@enum.value MetricCalibrationStateNotCalibrated The metric has not been calibrated. }
    MetricCalibrationStateCalibrationRequired, {@enum.value MetricCalibrationStateCalibrationRequired The metric needs to be calibrated. }
    MetricCalibrationStateCalibrated, {@enum.value MetricCalibrationStateCalibrated The metric has been calibrated. }
    MetricCalibrationStateUnspecified); {@enum.value MetricCalibrationStateUnspecified The state of calibration of this metric is unspecified. }
  TFhirMetricCalibrationStateList = set of TFhirMetricCalibrationState;

  {@Enum TFhirDeviceUseRequestStatus
    Codes representing the status of the request
  }
  TFhirDeviceUseRequestStatus = (
    DeviceUseRequestStatusNull,  {@enum.value DeviceUseRequestStatusNull Value is missing from Instance }
    DeviceUseRequestStatusProposed, {@enum.value DeviceUseRequestStatusProposed The request has been proposed. }
    DeviceUseRequestStatusPlanned, {@enum.value DeviceUseRequestStatusPlanned The request has been planned. }
    DeviceUseRequestStatusRequested, {@enum.value DeviceUseRequestStatusRequested The request has been placed. }
    DeviceUseRequestStatusReceived, {@enum.value DeviceUseRequestStatusReceived The receiving system has received the request but not yet decided whether it will be performed. }
    DeviceUseRequestStatusAccepted, {@enum.value DeviceUseRequestStatusAccepted The receiving system has accepted the request but work has not yet commenced. }
    DeviceUseRequestStatusInProgress, {@enum.value DeviceUseRequestStatusInProgress The work to fulfill the order is happening. }
    DeviceUseRequestStatusCompleted, {@enum.value DeviceUseRequestStatusCompleted The work has been complete, the report(s) released, and no further work is planned. }
    DeviceUseRequestStatusSuspended, {@enum.value DeviceUseRequestStatusSuspended The request has been held by originating system/user request. }
    DeviceUseRequestStatusRejected, {@enum.value DeviceUseRequestStatusRejected The receiving system has declined to fulfill the request. }
    DeviceUseRequestStatusAborted); {@enum.value DeviceUseRequestStatusAborted The request was attempted, but due to some procedural error, it could not be completed. }
  TFhirDeviceUseRequestStatusList = set of TFhirDeviceUseRequestStatus;

  {@Enum TFhirDeviceUseRequestPriority
    Codes representing the priority of the request
  }
  TFhirDeviceUseRequestPriority = (
    DeviceUseRequestPriorityNull,  {@enum.value DeviceUseRequestPriorityNull Value is missing from Instance }
    DeviceUseRequestPriorityRoutine, {@enum.value DeviceUseRequestPriorityRoutine The request has a normal priority. }
    DeviceUseRequestPriorityUrgent, {@enum.value DeviceUseRequestPriorityUrgent The request should be done urgently. }
    DeviceUseRequestPriorityStat, {@enum.value DeviceUseRequestPriorityStat The request is time-critical. }
    DeviceUseRequestPriorityAsap); {@enum.value DeviceUseRequestPriorityAsap The request should be acted on as soon as possible. }
  TFhirDeviceUseRequestPriorityList = set of TFhirDeviceUseRequestPriority;

  {@Enum TFhirDiagnosticOrderStatus
    The status of a diagnostic order
  }
  TFhirDiagnosticOrderStatus = (
    DiagnosticOrderStatusNull,  {@enum.value DiagnosticOrderStatusNull Value is missing from Instance }
    DiagnosticOrderStatusRequested, {@enum.value DiagnosticOrderStatusRequested The request has been placed. }
    DiagnosticOrderStatusReceived, {@enum.value DiagnosticOrderStatusReceived The receiving system has received the order, but not yet decided whether it will be performed. }
    DiagnosticOrderStatusAccepted, {@enum.value DiagnosticOrderStatusAccepted The receiving system has accepted the order, but work has not yet commenced. }
    DiagnosticOrderStatusInProgress, {@enum.value DiagnosticOrderStatusInProgress The work to fulfill the order is happening. }
    DiagnosticOrderStatusReview, {@enum.value DiagnosticOrderStatusReview The work is complete, and the outcomes are being reviewed for approval. }
    DiagnosticOrderStatusCompleted, {@enum.value DiagnosticOrderStatusCompleted The work has been complete, the report(s) released, and no further work is planned. }
    DiagnosticOrderStatusSuspended, {@enum.value DiagnosticOrderStatusSuspended The request has been held by originating system/user request. }
    DiagnosticOrderStatusRejected, {@enum.value DiagnosticOrderStatusRejected The receiving system has declined to fulfill the request. }
    DiagnosticOrderStatusFailed); {@enum.value DiagnosticOrderStatusFailed The diagnostic investigation was attempted, but due to some procedural error, it could not be completed. }
  TFhirDiagnosticOrderStatusList = set of TFhirDiagnosticOrderStatus;

  {@Enum TFhirDiagnosticOrderPriority
    The clinical priority of a diagnostic order
  }
  TFhirDiagnosticOrderPriority = (
    DiagnosticOrderPriorityNull,  {@enum.value DiagnosticOrderPriorityNull Value is missing from Instance }
    DiagnosticOrderPriorityRoutine, {@enum.value DiagnosticOrderPriorityRoutine The order has a normal priority. }
    DiagnosticOrderPriorityUrgent, {@enum.value DiagnosticOrderPriorityUrgent The order should be urgently. }
    DiagnosticOrderPriorityStat, {@enum.value DiagnosticOrderPriorityStat The order is time-critical. }
    DiagnosticOrderPriorityAsap); {@enum.value DiagnosticOrderPriorityAsap The order should be acted on as soon as possible. }
  TFhirDiagnosticOrderPriorityList = set of TFhirDiagnosticOrderPriority;

  {@Enum TFhirDiagnosticReportStatus
    The status of the diagnostic report as a whole
  }
  TFhirDiagnosticReportStatus = (
    DiagnosticReportStatusNull,  {@enum.value DiagnosticReportStatusNull Value is missing from Instance }
    DiagnosticReportStatusRegistered, {@enum.value DiagnosticReportStatusRegistered The existence of the report is registered, but there is nothing yet available. }
    DiagnosticReportStatusPartial, {@enum.value DiagnosticReportStatusPartial This is a partial (e.g. initial, interim or preliminary) report: data in the report may be incomplete or unverified. }
    DiagnosticReportStatusFinal, {@enum.value DiagnosticReportStatusFinal The report is complete and verified by an authorized person. }
    DiagnosticReportStatusCorrected, {@enum.value DiagnosticReportStatusCorrected The report has been modified subsequent to being Final, and is complete and verified by an authorized person. }
    DiagnosticReportStatusAmended, {@enum.value DiagnosticReportStatusAmended The report has been modified subsequent to being Final, and is complete and verified by an authorized person, and data has been changed. }
    DiagnosticReportStatusAppended, {@enum.value DiagnosticReportStatusAppended The report has been modified subsequent to being Final, and is complete and verified by an authorized person. New content has been added, but existing content hasn't changed. }
    DiagnosticReportStatusCancelled, {@enum.value DiagnosticReportStatusCancelled The report is unavailable because the measurement was not started or not completed (also sometimes called "aborted"). }
    DiagnosticReportStatusEnteredInError); {@enum.value DiagnosticReportStatusEnteredInError The report has been withdrawn following previous Final release. }
  TFhirDiagnosticReportStatusList = set of TFhirDiagnosticReportStatus;

  {@Enum TFhirDocumentReferenceStatus
    The status of the document reference
  }
  TFhirDocumentReferenceStatus = (
    DocumentReferenceStatusNull,  {@enum.value DocumentReferenceStatusNull Value is missing from Instance }
    DocumentReferenceStatusCurrent, {@enum.value DocumentReferenceStatusCurrent This is the current reference for this document. }
    DocumentReferenceStatusSuperceded, {@enum.value DocumentReferenceStatusSuperceded This reference has been superseded by another reference. }
    DocumentReferenceStatusEnteredInError); {@enum.value DocumentReferenceStatusEnteredInError This reference was created in error. }
  TFhirDocumentReferenceStatusList = set of TFhirDocumentReferenceStatus;

  {@Enum TFhirDocumentRelationshipType
    The type of relationship between documents
  }
  TFhirDocumentRelationshipType = (
    DocumentRelationshipTypeNull,  {@enum.value DocumentRelationshipTypeNull Value is missing from Instance }
    DocumentRelationshipTypeReplaces, {@enum.value DocumentRelationshipTypeReplaces This document logically replaces or supercedes the target document. }
    DocumentRelationshipTypeTransforms, {@enum.value DocumentRelationshipTypeTransforms This document was generated by transforming the target document (e.g. format or language conversion). }
    DocumentRelationshipTypeSigns, {@enum.value DocumentRelationshipTypeSigns This document is a signature of the target document. }
    DocumentRelationshipTypeAppends); {@enum.value DocumentRelationshipTypeAppends This document adds additional information to the target document. }
  TFhirDocumentRelationshipTypeList = set of TFhirDocumentRelationshipType;

  {@Enum TFhirEncounterState
    Current state of the encounter
  }
  TFhirEncounterState = (
    EncounterStateNull,  {@enum.value EncounterStateNull Value is missing from Instance }
    EncounterStatePlanned, {@enum.value EncounterStatePlanned The Encounter has not yet started. }
    EncounterStateArrived, {@enum.value EncounterStateArrived The Patient is present for the encounter, however is not currently meeting with a practitioner. }
    EncounterStateInProgress, {@enum.value EncounterStateInProgress The Encounter has begun and the patient is present / the practitioner and the patient are meeting. }
    EncounterStateOnleave, {@enum.value EncounterStateOnleave The Encounter has begun, but the patient is temporarily on leave. }
    EncounterStateFinished, {@enum.value EncounterStateFinished The Encounter has ended. }
    EncounterStateCancelled); {@enum.value EncounterStateCancelled The Encounter has ended before it has begun. }
  TFhirEncounterStateList = set of TFhirEncounterState;

  {@Enum TFhirEncounterClass
    Classification of the encounter
  }
  TFhirEncounterClass = (
    EncounterClassNull,  {@enum.value EncounterClassNull Value is missing from Instance }
    EncounterClassInpatient, {@enum.value EncounterClassInpatient An encounter during which the patient is hospitalized and stays overnight. }
    EncounterClassOutpatient, {@enum.value EncounterClassOutpatient An encounter during which the patient is not hospitalized overnight. }
    EncounterClassAmbulatory, {@enum.value EncounterClassAmbulatory An encounter where the patient visits the practitioner in his/her office, e.g. a G.P. visit. }
    EncounterClassEmergency, {@enum.value EncounterClassEmergency An encounter where the patient needs urgent care. }
    EncounterClassHome, {@enum.value EncounterClassHome An encounter where the practitioner visits the patient at his/her home. }
    EncounterClassField, {@enum.value EncounterClassField An encounter taking place outside the regular environment for giving care. }
    EncounterClassDaytime, {@enum.value EncounterClassDaytime An encounter where the patient needs more prolonged treatment or investigations than outpatients, but who do not need to stay in the hospital overnight. }
    EncounterClassVirtual, {@enum.value EncounterClassVirtual An encounter that takes place where the patient and practitioner do not physically meet but use electronic means for contact. }
    EncounterClassOther); {@enum.value EncounterClassOther Any other encounter type that is not described by one of the other values. Where this is used it is expected that an implementer will include an extension value to define what the actual other type is. }
  TFhirEncounterClassList = set of TFhirEncounterClass;

  {@Enum TFhirEncounterLocationStatus
    The status of the location
  }
  TFhirEncounterLocationStatus = (
    EncounterLocationStatusNull,  {@enum.value EncounterLocationStatusNull Value is missing from Instance }
    EncounterLocationStatusPlanned, {@enum.value EncounterLocationStatusPlanned The patient is planned to be moved to this location at some point in the future. }
    EncounterLocationStatusPresent, {@enum.value EncounterLocationStatusPresent The patient is currently at this location, or was between the period specified. }
    EncounterLocationStatusReserved); {@enum.value EncounterLocationStatusReserved This location is held empty for this patient. }
  TFhirEncounterLocationStatusList = set of TFhirEncounterLocationStatus;

  {@Enum TFhirEpisodeOfCareStatus
    The status of the encounter
  }
  TFhirEpisodeOfCareStatus = (
    EpisodeOfCareStatusNull,  {@enum.value EpisodeOfCareStatusNull Value is missing from Instance }
    EpisodeOfCareStatusPlanned, {@enum.value EpisodeOfCareStatusPlanned This episode of care is planned to start at the date specified in the period.start. During this status an organization may perform assessments to determine if they are eligible to receive services, or be organizing to make resources available to provide care services. }
    EpisodeOfCareStatusActive, {@enum.value EpisodeOfCareStatusActive This episode of care is current. }
    EpisodeOfCareStatusOnhold, {@enum.value EpisodeOfCareStatusOnhold This episode of care is on hold, the organization has limitted responsibility for the patient (such as while on respite). }
    EpisodeOfCareStatusFinished, {@enum.value EpisodeOfCareStatusFinished This episode of care is finished at the organization is not expecting to be providing care to the patient. }
    EpisodeOfCareStatusWithdrawn, {@enum.value EpisodeOfCareStatusWithdrawn The episode of care was withdrawn from service, often selected during the planned stage as the patient may have gone elsewhere, or the circumstances have changed and the organization is unable to provide the care. }
    EpisodeOfCareStatusOther); {@enum.value EpisodeOfCareStatusOther The status is outside one of these values, an extension should be used to define what the status reason is. }
  TFhirEpisodeOfCareStatusList = set of TFhirEpisodeOfCareStatus;

  {@Enum TFhirResourceProfileStatus
    The lifecycle status of a Resource Profile
  }
  TFhirResourceProfileStatus = (
    ResourceProfileStatusNull,  {@enum.value ResourceProfileStatusNull Value is missing from Instance }
    ResourceProfileStatusDraft, {@enum.value ResourceProfileStatusDraft This profile is still under development. }
    ResourceProfileStatusActive, {@enum.value ResourceProfileStatusActive This profile is ready for normal use. }
    ResourceProfileStatusRetired); {@enum.value ResourceProfileStatusRetired This profile has been deprecated, withdrawn or superseded and should no longer be used. }
  TFhirResourceProfileStatusList = set of TFhirResourceProfileStatus;

  {@Enum TFhirExtensionContext
    How an extension context is interpreted
  }
  TFhirExtensionContext = (
    ExtensionContextNull,  {@enum.value ExtensionContextNull Value is missing from Instance }
    ExtensionContextResource, {@enum.value ExtensionContextResource The context is all elements matching a particular resource element path. }
    ExtensionContextDatatype, {@enum.value ExtensionContextDatatype The context is all nodes matching a particular data type element path (root or repeating element) or all elements referencing a particular primitive data type (expressed as the datatype name). }
    ExtensionContextMapping, {@enum.value ExtensionContextMapping The context is all nodes whose mapping to a specified reference model corresponds to a particular mapping structure.  The context identifies the mapping target. The mapping should clearly identify where such an extension could be used. }
    ExtensionContextExtension); {@enum.value ExtensionContextExtension The context is a particular extension from a particular profile.  Expressed as uri#name, where uri identifies the profile and #name identifies the extension code. }
  TFhirExtensionContextList = set of TFhirExtensionContext;

  {@Enum TFhirGoalStatus
    Indicates whether the goal has been met and is still being targeted
  }
  TFhirGoalStatus = (
    GoalStatusNull,  {@enum.value GoalStatusNull Value is missing from Instance }
    GoalStatusProposed, {@enum.value GoalStatusProposed A goal is proposed for this patient. }
    GoalStatusPlanned, {@enum.value GoalStatusPlanned A goal is planned for this patient. }
    GoalStatusInProgress, {@enum.value GoalStatusInProgress The goal is being sought but has not yet been reached.  (Also applies if goal was reached in the past but there has been regression and goal is being sought again). }
    GoalStatusAchieved, {@enum.value GoalStatusAchieved The goal has been met and no further action is needed. }
    GoalStatusSustaining, {@enum.value GoalStatusSustaining The goal has been met, but ongoing activity is needed to sustain the goal objective. }
    GoalStatusCancelled, {@enum.value GoalStatusCancelled The goal is no longer being sought. }
    GoalStatusAccepted, {@enum.value GoalStatusAccepted A proposed goal was accepted. }
    GoalStatusRejected); {@enum.value GoalStatusRejected A proposed goal was rejected. }
  TFhirGoalStatusList = set of TFhirGoalStatus;

  {@Enum TFhirGroupType
    Types of resources that are part of group
  }
  TFhirGroupType = (
    GroupTypeNull,  {@enum.value GroupTypeNull Value is missing from Instance }
    GroupTypePerson, {@enum.value GroupTypePerson Group contains "person" Patient resources. }
    GroupTypeAnimal, {@enum.value GroupTypeAnimal Group contains "animal" Patient resources. }
    GroupTypePractitioner, {@enum.value GroupTypePractitioner Group contains healthcare practitioner resources. }
    GroupTypeDevice, {@enum.value GroupTypeDevice Group contains Device resources. }
    GroupTypeMedication, {@enum.value GroupTypeMedication Group contains Medication resources. }
    GroupTypeSubstance); {@enum.value GroupTypeSubstance Group contains Substance resources. }
  TFhirGroupTypeList = set of TFhirGroupType;

  {@Enum TFhirImagingModality
    Type of acquired image data in the instance
  }
  TFhirImagingModality = (
    ImagingModalityNull,  {@enum.value ImagingModalityNull Value is missing from Instance }
    ImagingModalityAR, {@enum.value ImagingModalityAR  }
    ImagingModalityBMD, {@enum.value ImagingModalityBMD  }
    ImagingModalityBDUS, {@enum.value ImagingModalityBDUS  }
    ImagingModalityEPS, {@enum.value ImagingModalityEPS  }
    ImagingModalityCR, {@enum.value ImagingModalityCR  }
    ImagingModalityCT, {@enum.value ImagingModalityCT  }
    ImagingModalityDX, {@enum.value ImagingModalityDX  }
    ImagingModalityECG, {@enum.value ImagingModalityECG  }
    ImagingModalityES, {@enum.value ImagingModalityES  }
    ImagingModalityXC, {@enum.value ImagingModalityXC  }
    ImagingModalityGM, {@enum.value ImagingModalityGM  }
    ImagingModalityHD, {@enum.value ImagingModalityHD  }
    ImagingModalityIO, {@enum.value ImagingModalityIO  }
    ImagingModalityIVOCT, {@enum.value ImagingModalityIVOCT  }
    ImagingModalityIVUS, {@enum.value ImagingModalityIVUS  }
    ImagingModalityKER, {@enum.value ImagingModalityKER  }
    ImagingModalityLEN, {@enum.value ImagingModalityLEN  }
    ImagingModalityMR, {@enum.value ImagingModalityMR  }
    ImagingModalityMG, {@enum.value ImagingModalityMG  }
    ImagingModalityNM, {@enum.value ImagingModalityNM  }
    ImagingModalityOAM, {@enum.value ImagingModalityOAM  }
    ImagingModalityOCT, {@enum.value ImagingModalityOCT  }
    ImagingModalityOPM, {@enum.value ImagingModalityOPM  }
    ImagingModalityOP, {@enum.value ImagingModalityOP  }
    ImagingModalityOPR, {@enum.value ImagingModalityOPR  }
    ImagingModalityOPT, {@enum.value ImagingModalityOPT  }
    ImagingModalityOPV, {@enum.value ImagingModalityOPV  }
    ImagingModalityPX, {@enum.value ImagingModalityPX  }
    ImagingModalityPT, {@enum.value ImagingModalityPT  }
    ImagingModalityRF, {@enum.value ImagingModalityRF  }
    ImagingModalityRG, {@enum.value ImagingModalityRG  }
    ImagingModalitySM, {@enum.value ImagingModalitySM  }
    ImagingModalitySRF, {@enum.value ImagingModalitySRF  }
    ImagingModalityUS, {@enum.value ImagingModalityUS  }
    ImagingModalityVA, {@enum.value ImagingModalityVA  }
    ImagingModalityXA); {@enum.value ImagingModalityXA  }
  TFhirImagingModalityList = set of TFhirImagingModality;

  {@Enum TFhirInstanceAvailability
    Availability of the resource
  }
  TFhirInstanceAvailability = (
    InstanceAvailabilityNull,  {@enum.value InstanceAvailabilityNull Value is missing from Instance }
    InstanceAvailabilityONLINE, {@enum.value InstanceAvailabilityONLINE Resources are immediately available,. }
    InstanceAvailabilityOFFLINE, {@enum.value InstanceAvailabilityOFFLINE Resources need to be retrieved by manual intervention. }
    InstanceAvailabilityNEARLINE, {@enum.value InstanceAvailabilityNEARLINE Resources need to be retrieved from relatively slow media. }
    InstanceAvailabilityUNAVAILABLE); {@enum.value InstanceAvailabilityUNAVAILABLE Resources cannot be retrieved. }
  TFhirInstanceAvailabilityList = set of TFhirInstanceAvailability;

  {@Enum TFhirModality
    Type of data in the instance
  }
  TFhirModality = (
    ModalityNull,  {@enum.value ModalityNull Value is missing from Instance }
    ModalityAR, {@enum.value ModalityAR  }
    ModalityAU, {@enum.value ModalityAU  }
    ModalityBDUS, {@enum.value ModalityBDUS  }
    ModalityBI, {@enum.value ModalityBI  }
    ModalityBMD, {@enum.value ModalityBMD  }
    ModalityCR, {@enum.value ModalityCR  }
    ModalityCT, {@enum.value ModalityCT  }
    ModalityDG, {@enum.value ModalityDG  }
    ModalityDX, {@enum.value ModalityDX  }
    ModalityECG, {@enum.value ModalityECG  }
    ModalityEPS, {@enum.value ModalityEPS  }
    ModalityES, {@enum.value ModalityES  }
    ModalityGM, {@enum.value ModalityGM  }
    ModalityHC, {@enum.value ModalityHC  }
    ModalityHD, {@enum.value ModalityHD  }
    ModalityIO, {@enum.value ModalityIO  }
    ModalityIVOCT, {@enum.value ModalityIVOCT  }
    ModalityIVUS, {@enum.value ModalityIVUS  }
    ModalityKER, {@enum.value ModalityKER  }
    ModalityKO, {@enum.value ModalityKO  }
    ModalityLEN, {@enum.value ModalityLEN  }
    ModalityLS, {@enum.value ModalityLS  }
    ModalityMG, {@enum.value ModalityMG  }
    ModalityMR, {@enum.value ModalityMR  }
    ModalityNM, {@enum.value ModalityNM  }
    ModalityOAM, {@enum.value ModalityOAM  }
    ModalityOCT, {@enum.value ModalityOCT  }
    ModalityOP, {@enum.value ModalityOP  }
    ModalityOPM, {@enum.value ModalityOPM  }
    ModalityOPT, {@enum.value ModalityOPT  }
    ModalityOPV, {@enum.value ModalityOPV  }
    ModalityOT, {@enum.value ModalityOT  }
    ModalityPR, {@enum.value ModalityPR  }
    ModalityPT, {@enum.value ModalityPT  }
    ModalityPX, {@enum.value ModalityPX  }
    ModalityREG, {@enum.value ModalityREG  }
    ModalityRF, {@enum.value ModalityRF  }
    ModalityRG, {@enum.value ModalityRG  }
    ModalityRTDOSE, {@enum.value ModalityRTDOSE  }
    ModalityRTIMAGE, {@enum.value ModalityRTIMAGE  }
    ModalityRTPLAN, {@enum.value ModalityRTPLAN  }
    ModalityRTRECORD, {@enum.value ModalityRTRECORD  }
    ModalityRTSTRUCT, {@enum.value ModalityRTSTRUCT  }
    ModalitySEG, {@enum.value ModalitySEG  }
    ModalitySM, {@enum.value ModalitySM  }
    ModalitySMR, {@enum.value ModalitySMR  }
    ModalitySR, {@enum.value ModalitySR  }
    ModalitySRF, {@enum.value ModalitySRF  }
    ModalityTG, {@enum.value ModalityTG  }
    ModalityUS, {@enum.value ModalityUS  }
    ModalityVA, {@enum.value ModalityVA  }
    ModalityXA, {@enum.value ModalityXA  }
    ModalityXC); {@enum.value ModalityXC  }
  TFhirModalityList = set of TFhirModality;

  {@Enum TFhirUseLink
    Complete, proposed, exploratory, other
  }
  TFhirUseLink = (
    UseLinkNull,  {@enum.value UseLinkNull Value is missing from Instance }
    UseLinkComplete, {@enum.value UseLinkComplete The treatment is complete and this represents a Claim for the services. }
    UseLinkProposed, {@enum.value UseLinkProposed The treatment is proposed and this represents a Pre-authorization for the services. }
    UseLinkExploratory, {@enum.value UseLinkExploratory The treatment is proposed and this represents a Pre-determination for the services. }
    UseLinkOther); {@enum.value UseLinkOther A locally defined or otherwise resolved status. }
  TFhirUseLinkList = set of TFhirUseLink;

  {@Enum TFhirListMode
    The processing mode that applies to this list
  }
  TFhirListMode = (
    ListModeNull,  {@enum.value ListModeNull Value is missing from Instance }
    ListModeWorking, {@enum.value ListModeWorking This list is the master list, maintained in an ongoing fashion with regular updates as the real world list it is tracking changes. }
    ListModeSnapshot, {@enum.value ListModeSnapshot This list was prepared as a snapshot. It should not be assumed to be current. }
    ListModeChanges); {@enum.value ListModeChanges The list is prepared as a statement of changes that have been made or recommended. }
  TFhirListModeList = set of TFhirListMode;

  {@Enum TFhirLocationStatus
    Indicates whether the location is still in use
  }
  TFhirLocationStatus = (
    LocationStatusNull,  {@enum.value LocationStatusNull Value is missing from Instance }
    LocationStatusActive, {@enum.value LocationStatusActive The location is operational. }
    LocationStatusSuspended, {@enum.value LocationStatusSuspended The location is temporarily closed. }
    LocationStatusInactive); {@enum.value LocationStatusInactive The location is no longer used. }
  TFhirLocationStatusList = set of TFhirLocationStatus;

  {@Enum TFhirLocationMode
    Indicates whether a resource instance represents a specific location or a class of locations
  }
  TFhirLocationMode = (
    LocationModeNull,  {@enum.value LocationModeNull Value is missing from Instance }
    LocationModeInstance, {@enum.value LocationModeInstance The Location resource represents a specific instance of a Location. }
    LocationModeKind); {@enum.value LocationModeKind The Location represents a class of Locations. }
  TFhirLocationModeList = set of TFhirLocationMode;

  {@Enum TFhirMediaType
    Whether the Media is a photo, video, or audio
  }
  TFhirMediaType = (
    MediaTypeNull,  {@enum.value MediaTypeNull Value is missing from Instance }
    MediaTypePhoto, {@enum.value MediaTypePhoto The media consists of one or more unmoving images, including photographs, computer-generated graphs and charts, and scanned documents. }
    MediaTypeVideo, {@enum.value MediaTypeVideo The media consists of a series of frames that capture a moving image. }
    MediaTypeAudio); {@enum.value MediaTypeAudio The media consists of a sound recording. }
  TFhirMediaTypeList = set of TFhirMediaType;

  {@Enum TFhirMedicationKind
    Whether the medication is a product or a package
  }
  TFhirMedicationKind = (
    MedicationKindNull,  {@enum.value MedicationKindNull Value is missing from Instance }
    MedicationKindProduct, {@enum.value MedicationKindProduct The medication is a product. }
    MedicationKindPackage); {@enum.value MedicationKindPackage The medication is a package - a contained group of one of more products. }
  TFhirMedicationKindList = set of TFhirMedicationKind;

  {@Enum TFhirMedicationAdminStatus
    A set of codes indicating the current status of a MedicationAdministration
  }
  TFhirMedicationAdminStatus = (
    MedicationAdminStatusNull,  {@enum.value MedicationAdminStatusNull Value is missing from Instance }
    MedicationAdminStatusInProgress, {@enum.value MedicationAdminStatusInProgress The administration has started but has not yet completed. }
    MedicationAdminStatusOnHold, {@enum.value MedicationAdminStatusOnHold Actions implied by the administration have been temporarily halted, but are expected to continue later. May also be called "suspended". }
    MedicationAdminStatusCompleted, {@enum.value MedicationAdminStatusCompleted All actions that are implied by the administration have occurred. }
    MedicationAdminStatusEnteredInError, {@enum.value MedicationAdminStatusEnteredInError The administration was entered in error and therefore nullified. }
    MedicationAdminStatusStopped); {@enum.value MedicationAdminStatusStopped Actions implied by the administration have been permanently halted, before all of them occurred. }
  TFhirMedicationAdminStatusList = set of TFhirMedicationAdminStatus;

  {@Enum TFhirMedicationDispenseStatus
    A code specifying the state of the dispense event.
  }
  TFhirMedicationDispenseStatus = (
    MedicationDispenseStatusNull,  {@enum.value MedicationDispenseStatusNull Value is missing from Instance }
    MedicationDispenseStatusInProgress, {@enum.value MedicationDispenseStatusInProgress The dispense has started but has not yet completed. }
    MedicationDispenseStatusOnHold, {@enum.value MedicationDispenseStatusOnHold Actions implied by the administration have been temporarily halted, but are expected to continue later. May also be called "suspended". }
    MedicationDispenseStatusCompleted, {@enum.value MedicationDispenseStatusCompleted All actions that are implied by the dispense have occurred. }
    MedicationDispenseStatusEnteredInError, {@enum.value MedicationDispenseStatusEnteredInError The dispense was entered in error and therefore nullified. }
    MedicationDispenseStatusStopped); {@enum.value MedicationDispenseStatusStopped Actions implied by the dispense have been permanently halted, before all of them occurred. }
  TFhirMedicationDispenseStatusList = set of TFhirMedicationDispenseStatus;

  {@Enum TFhirMedicationPrescriptionStatus
    A code specifying the state of the prescribing event. Describes the lifecycle of the prescription.
  }
  TFhirMedicationPrescriptionStatus = (
    MedicationPrescriptionStatusNull,  {@enum.value MedicationPrescriptionStatusNull Value is missing from Instance }
    MedicationPrescriptionStatusActive, {@enum.value MedicationPrescriptionStatusActive The prescription is 'actionable', but not all actions that are implied by it have occurred yet. }
    MedicationPrescriptionStatusOnHold, {@enum.value MedicationPrescriptionStatusOnHold Actions implied by the prescription have been temporarily halted, but are expected to continue later.  May also be called "suspended". }
    MedicationPrescriptionStatusCompleted, {@enum.value MedicationPrescriptionStatusCompleted All actions that are implied by the prescription have occurred (this will rarely be made explicit). }
    MedicationPrescriptionStatusEnteredInError, {@enum.value MedicationPrescriptionStatusEnteredInError The prescription was entered in error and therefore nullified. }
    MedicationPrescriptionStatusStopped, {@enum.value MedicationPrescriptionStatusStopped Actions implied by the prescription have been permanently halted, before all of them occurred. }
    MedicationPrescriptionStatusSuperceded); {@enum.value MedicationPrescriptionStatusSuperceded The prescription was replaced by a newer one, which encompasses all the information in the previous one. }
  TFhirMedicationPrescriptionStatusList = set of TFhirMedicationPrescriptionStatus;

  {@Enum TFhirResponseCode
    The kind of response to a message
  }
  TFhirResponseCode = (
    ResponseCodeNull,  {@enum.value ResponseCodeNull Value is missing from Instance }
    ResponseCodeOk, {@enum.value ResponseCodeOk The message was accepted and processed without error. }
    ResponseCodeTransientError, {@enum.value ResponseCodeTransientError Some internal unexpected error occurred - wait and try again. Note - this is usually used for things like database unavailable, which may be expected to resolve, though human intervention may be required. }
    ResponseCodeFatalError); {@enum.value ResponseCodeFatalError The message was rejected because of some content in it. There is no point in re-sending without change. The response narrative SHALL describe what the issue is. }
  TFhirResponseCodeList = set of TFhirResponseCode;

  {@Enum TFhirNamingsystemType
    Identifies the purpose of the namingsystem
  }
  TFhirNamingsystemType = (
    NamingsystemTypeNull,  {@enum.value NamingsystemTypeNull Value is missing from Instance }
    NamingsystemTypeCodesystem, {@enum.value NamingsystemTypeCodesystem The namingsystem is used to define concepts and symbols to represent those concepts.  E.g. UCUM, LOINC, NDC code, local lab codes, etc. }
    NamingsystemTypeIdentifier, {@enum.value NamingsystemTypeIdentifier The namingsystem is used to manage identifiers (e.g. license numbers, order numbers, etc.). }
    NamingsystemTypeRoot); {@enum.value NamingsystemTypeRoot The namingsystem is used as the root for other identifiers and namingsystems. }
  TFhirNamingsystemTypeList = set of TFhirNamingsystemType;

  {@Enum TFhirNamingsystemStatus
    Indicates whether the namingsystem should be used
  }
  TFhirNamingsystemStatus = (
    NamingsystemStatusNull,  {@enum.value NamingsystemStatusNull Value is missing from Instance }
    NamingsystemStatusProposed, {@enum.value NamingsystemStatusProposed System has been submitted but not yet approved. }
    NamingsystemStatusActive, {@enum.value NamingsystemStatusActive System is valid for use. }
    NamingsystemStatusRetired); {@enum.value NamingsystemStatusRetired System should no longer be used. }
  TFhirNamingsystemStatusList = set of TFhirNamingsystemStatus;

  {@Enum TFhirNamingsystemIdentifierType
    Identifies the style of unique identifier used to identify a namepace
  }
  TFhirNamingsystemIdentifierType = (
    NamingsystemIdentifierTypeNull,  {@enum.value NamingsystemIdentifierTypeNull Value is missing from Instance }
    NamingsystemIdentifierTypeOid, {@enum.value NamingsystemIdentifierTypeOid An ISO object identifier.  E.g. 1.2.3.4.5. }
    NamingsystemIdentifierTypeUuid, {@enum.value NamingsystemIdentifierTypeUuid A universally unique identifier of the form a5afddf4-e880-459b-876e-e4591b0acc11. }
    NamingsystemIdentifierTypeUri, {@enum.value NamingsystemIdentifierTypeUri A uniform resource identifier (ideally a URL - uniform resource locator).  E.g. http://unitsofmeasure.org. }
    NamingsystemIdentifierTypeOther); {@enum.value NamingsystemIdentifierTypeOther Some other type of unique identifier.  E.g HL7-assigned reserved string such as LN for LOINC. }
  TFhirNamingsystemIdentifierTypeList = set of TFhirNamingsystemIdentifierType;

  {@Enum TFhirNutritionOrderStatus
    TODO
  }
  TFhirNutritionOrderStatus = (
    NutritionOrderStatusNull,  {@enum.value NutritionOrderStatusNull Value is missing from Instance }
    NutritionOrderStatusRequested, {@enum.value NutritionOrderStatusRequested TODO. }
    NutritionOrderStatusActive, {@enum.value NutritionOrderStatusActive TODO. }
    NutritionOrderStatusInactive, {@enum.value NutritionOrderStatusInactive TODO. }
    NutritionOrderStatusHeld, {@enum.value NutritionOrderStatusHeld TODO. }
    NutritionOrderStatusCancelled); {@enum.value NutritionOrderStatusCancelled TODO. }
  TFhirNutritionOrderStatusList = set of TFhirNutritionOrderStatus;

  {@Enum TFhirDataAbsentReason
    Used to specify why the normally expected content of the data element is missing
  }
  TFhirDataAbsentReason = (
    DataAbsentReasonNull,  {@enum.value DataAbsentReasonNull Value is missing from Instance }
    DataAbsentReasonUnknown, {@enum.value DataAbsentReasonUnknown The value is not known }
    DataAbsentReasonAsked, {@enum.value DataAbsentReasonAsked The source human does not know the value }
    DataAbsentReasonTemp, {@enum.value DataAbsentReasonTemp There is reason to expect (from the workflow) that the value may become known }
    DataAbsentReasonNotasked, {@enum.value DataAbsentReasonNotasked The workflow didn't lead to this value being known }
    DataAbsentReasonMasked, {@enum.value DataAbsentReasonMasked The information is not available due to security, privacy or related reasons }
    DataAbsentReasonUnsupported, {@enum.value DataAbsentReasonUnsupported The source system wasn't capable of supporting this element }
    DataAbsentReasonAstext, {@enum.value DataAbsentReasonAstext The content of the data is represented in the resource narrative }
    DataAbsentReasonError); {@enum.value DataAbsentReasonError Some system or workflow process error means that the information is not available }
  TFhirDataAbsentReasonList = set of TFhirDataAbsentReason;

  {@Enum TFhirObservationStatus
    Codes providing the status of an observation
  }
  TFhirObservationStatus = (
    ObservationStatusNull,  {@enum.value ObservationStatusNull Value is missing from Instance }
    ObservationStatusRegistered, {@enum.value ObservationStatusRegistered The existence of the observation is registered, but there is no result yet available. }
    ObservationStatusPreliminary, {@enum.value ObservationStatusPreliminary This is an initial or interim observation: data may be incomplete or unverified. }
    ObservationStatusFinal, {@enum.value ObservationStatusFinal The observation is complete and verified by an authorized person. }
    ObservationStatusAmended, {@enum.value ObservationStatusAmended The observation has been modified subsequent to being Final, and is complete and verified by an authorized person. }
    ObservationStatusCancelled, {@enum.value ObservationStatusCancelled The observation is unavailable because the measurement was not started or not completed (also sometimes called "aborted"). }
    ObservationStatusEnteredInError); {@enum.value ObservationStatusEnteredInError The observation has been withdrawn following previous Final release. }
  TFhirObservationStatusList = set of TFhirObservationStatus;

  {@Enum TFhirObservationReliability
    Codes that provide an estimate of the degree to which quality issues have impacted on the value of an observation
  }
  TFhirObservationReliability = (
    ObservationReliabilityNull,  {@enum.value ObservationReliabilityNull Value is missing from Instance }
    ObservationReliabilityOk, {@enum.value ObservationReliabilityOk The result has no reliability concerns. }
    ObservationReliabilityOngoing, {@enum.value ObservationReliabilityOngoing An early estimate of value; measurement is still occurring. }
    ObservationReliabilityEarly, {@enum.value ObservationReliabilityEarly An early estimate of value; processing is still occurring. }
    ObservationReliabilityQuestionable, {@enum.value ObservationReliabilityQuestionable The observation value should be treated with care. }
    ObservationReliabilityCalibrating, {@enum.value ObservationReliabilityCalibrating The result has been generated while calibration is occurring. }
    ObservationReliabilityError, {@enum.value ObservationReliabilityError The observation could not be completed because of an error. }
    ObservationReliabilityUnknown); {@enum.value ObservationReliabilityUnknown No observation  reliability value was available. }
  TFhirObservationReliabilityList = set of TFhirObservationReliability;

  {@Enum TFhirObservationRelationshiptypes
    Codes specifying how two observations are related
  }
  TFhirObservationRelationshiptypes = (
    ObservationRelationshiptypesNull,  {@enum.value ObservationRelationshiptypesNull Value is missing from Instance }
    ObservationRelationshiptypesHasComponent, {@enum.value ObservationRelationshiptypesHasComponent The target observation is a component of this observation (e.g. Systolic and Diastolic Blood Pressure). }
    ObservationRelationshiptypesHasMember, {@enum.value ObservationRelationshiptypesHasMember This observation is a group observation (e.g. a battery, a panel of tests, a set of vital sign measurements) that includes the target as a member of the group. }
    ObservationRelationshiptypesDerivedFrom, {@enum.value ObservationRelationshiptypesDerivedFrom The target observation is part of the information from which this observation value is derived (e.g. calculated anion gap, Apgar score). }
    ObservationRelationshiptypesSequelTo, {@enum.value ObservationRelationshiptypesSequelTo This observation follows the target observation (e.g. timed tests such as Glucose Tolerance Test). }
    ObservationRelationshiptypesReplaces, {@enum.value ObservationRelationshiptypesReplaces This observation replaces a previous observation (i.e. a revised value). The target observation is now obsolete. }
    ObservationRelationshiptypesQualifiedBy, {@enum.value ObservationRelationshiptypesQualifiedBy The value of the target observation qualifies (refines) the semantics of the source observation (e.g. a lipaemia measure target from a plasma measure). }
    ObservationRelationshiptypesInterferedBy); {@enum.value ObservationRelationshiptypesInterferedBy The value of the target observation interferes (degardes quality, or prevents valid observation) with the semantics of the source observation (e.g. a hemolysis measure target from a plasma potassium measure which has no value). }
  TFhirObservationRelationshiptypesList = set of TFhirObservationRelationshiptypes;

  {@Enum TFhirOperationKind
    Whether an operation is a normal operation or a query
  }
  TFhirOperationKind = (
    OperationKindNull,  {@enum.value OperationKindNull Value is missing from Instance }
    OperationKindOperation, {@enum.value OperationKindOperation This operation is invoked as an operation. }
    OperationKindQuery); {@enum.value OperationKindQuery This operation is a named query, invoked using the search mechanism. }
  TFhirOperationKindList = set of TFhirOperationKind;

  {@Enum TFhirOperationParameterUse
    Whether an operation parameter is an input or an output parameter
  }
  TFhirOperationParameterUse = (
    OperationParameterUseNull,  {@enum.value OperationParameterUseNull Value is missing from Instance }
    OperationParameterUseIn, {@enum.value OperationParameterUseIn This is an input parameter. }
    OperationParameterUseOut); {@enum.value OperationParameterUseOut This is an output parameter. }
  TFhirOperationParameterUseList = set of TFhirOperationParameterUse;

  {@Enum TFhirIssueSeverity
    How the issue affects the success of the action
  }
  TFhirIssueSeverity = (
    IssueSeverityNull,  {@enum.value IssueSeverityNull Value is missing from Instance }
    IssueSeverityFatal, {@enum.value IssueSeverityFatal The issue caused the action to fail, and no further checking could be performed. }
    IssueSeverityError, {@enum.value IssueSeverityError The issue is sufficiently important to cause the action to fail. }
    IssueSeverityWarning, {@enum.value IssueSeverityWarning The issue is not important enough to cause the action to fail, but may cause it to be performed suboptimally or in a way that is not as desired. }
    IssueSeverityInformation); {@enum.value IssueSeverityInformation The issue has no relation to the degree of success of the action. }
  TFhirIssueSeverityList = set of TFhirIssueSeverity;

  {@Enum TFhirOrderOutcomeCode
    The status of the response to an order
  }
  TFhirOrderOutcomeCode = (
    OrderOutcomeCodeNull,  {@enum.value OrderOutcomeCodeNull Value is missing from Instance }
    OrderOutcomeCodePending, {@enum.value OrderOutcomeCodePending The order is known, but no processing has occurred at this time. }
    OrderOutcomeCodeReview, {@enum.value OrderOutcomeCodeReview The order is undergoing initial processing to determine whether it will be accepted (usually this involves human review). }
    OrderOutcomeCodeRejected, {@enum.value OrderOutcomeCodeRejected The order was rejected because of a workflow/business logic reason. }
    OrderOutcomeCodeError, {@enum.value OrderOutcomeCodeError The order was unable to be processed because of a technical error (i.e. unexpected error). }
    OrderOutcomeCodeAccepted, {@enum.value OrderOutcomeCodeAccepted The order has been accepted, and work is in progress. }
    OrderOutcomeCodeCancelled, {@enum.value OrderOutcomeCodeCancelled Processing the order was halted at the initiators request. }
    OrderOutcomeCodeReplaced, {@enum.value OrderOutcomeCodeReplaced The order has been cancelled and replaced by another. }
    OrderOutcomeCodeAborted, {@enum.value OrderOutcomeCodeAborted Processing the order was stopped because of some workflow/business logic reason. }
    OrderOutcomeCodeComplete); {@enum.value OrderOutcomeCodeComplete The order has been completed. }
  TFhirOrderOutcomeCodeList = set of TFhirOrderOutcomeCode;

  {@Enum TFhirAdministrativeGender
    The gender of a person used for administrative purposes
  }
  TFhirAdministrativeGender = (
    AdministrativeGenderNull,  {@enum.value AdministrativeGenderNull Value is missing from Instance }
    AdministrativeGenderMale, {@enum.value AdministrativeGenderMale Male }
    AdministrativeGenderFemale, {@enum.value AdministrativeGenderFemale Female }
    AdministrativeGenderOther, {@enum.value AdministrativeGenderOther Other }
    AdministrativeGenderUnknown); {@enum.value AdministrativeGenderUnknown Unknown }
  TFhirAdministrativeGenderList = set of TFhirAdministrativeGender;

  {@Enum TFhirLinkType
    The type of link between this patient resource and another patient resource.
  }
  TFhirLinkType = (
    LinkTypeNull,  {@enum.value LinkTypeNull Value is missing from Instance }
    LinkTypeReplace, {@enum.value LinkTypeReplace The patient resource containing this link must no longer be used. The link points forward to another patient resource that must be used in lieu of the patient resource that contains the link. }
    LinkTypeRefer, {@enum.value LinkTypeRefer The patient resource containing this link is in use and valid but not considered the main source of information about a patient. The link points forward to another patient resource that should be consulted to retrieve additional patient information. }
    LinkTypeSeealso); {@enum.value LinkTypeSeealso The patient resource containing this link is in use and valid, but points to another patient resource that is known to contain data about the same person. Data in this resource might overlap or contradict information found in the other patient resource. This link does not indicate any relative importance of the resources concerned, and both should be regarded as equally valid. }
  TFhirLinkTypeList = set of TFhirLinkType;

  {@Enum TFhirIdentityAssuranceLevel
    The level of confidence that this link represents the same actual person, based on NIST Authentication Levels
  }
  TFhirIdentityAssuranceLevel = (
    IdentityAssuranceLevelNull,  {@enum.value IdentityAssuranceLevelNull Value is missing from Instance }
    IdentityAssuranceLevelLevel1, {@enum.value IdentityAssuranceLevelLevel1 Little or no confidence in the asserted identity's accuracy. }
    IdentityAssuranceLevelLevel2, {@enum.value IdentityAssuranceLevelLevel2 Some confidence in the asserted identity's accuracy. }
    IdentityAssuranceLevelLevel3, {@enum.value IdentityAssuranceLevelLevel3 High confidence in the asserted identity's accuracy. }
    IdentityAssuranceLevelLevel4); {@enum.value IdentityAssuranceLevelLevel4 Very high confidence in the asserted identity's accuracy. }
  TFhirIdentityAssuranceLevelList = set of TFhirIdentityAssuranceLevel;

  {@Enum TFhirProcedureRelationshipType
    The nature of the relationship with this procedure
  }
  TFhirProcedureRelationshipType = (
    ProcedureRelationshipTypeNull,  {@enum.value ProcedureRelationshipTypeNull Value is missing from Instance }
    ProcedureRelationshipTypeCausedBy, {@enum.value ProcedureRelationshipTypeCausedBy This procedure had to be performed because of the related one. }
    ProcedureRelationshipTypeBecauseOf); {@enum.value ProcedureRelationshipTypeBecauseOf This procedure caused the related one to be performed. }
  TFhirProcedureRelationshipTypeList = set of TFhirProcedureRelationshipType;

  {@Enum TFhirProcedureRequestStatus
    The status of the request
  }
  TFhirProcedureRequestStatus = (
    ProcedureRequestStatusNull,  {@enum.value ProcedureRequestStatusNull Value is missing from Instance }
    ProcedureRequestStatusProposed, {@enum.value ProcedureRequestStatusProposed The request has been proposed. }
    ProcedureRequestStatusPlanned, {@enum.value ProcedureRequestStatusPlanned The request has been planned. }
    ProcedureRequestStatusRequested, {@enum.value ProcedureRequestStatusRequested The request has been placed. }
    ProcedureRequestStatusReceived, {@enum.value ProcedureRequestStatusReceived The receiving system has received the request but not yet decided whether it will be performed. }
    ProcedureRequestStatusAccepted, {@enum.value ProcedureRequestStatusAccepted The receiving system has accepted the request, but work has not yet commenced. }
    ProcedureRequestStatusInProgress, {@enum.value ProcedureRequestStatusInProgress The work to fulfill the request is happening. }
    ProcedureRequestStatusCompleted, {@enum.value ProcedureRequestStatusCompleted The work has been complete, the report(s) released, and no further work is planned. }
    ProcedureRequestStatusSuspended, {@enum.value ProcedureRequestStatusSuspended The request has been held by originating system/user request. }
    ProcedureRequestStatusRejected, {@enum.value ProcedureRequestStatusRejected The receiving system has declined to fulfill the request. }
    ProcedureRequestStatusAborted); {@enum.value ProcedureRequestStatusAborted The request was attempted, but due to some procedural error, it could not be completed. }
  TFhirProcedureRequestStatusList = set of TFhirProcedureRequestStatus;

  {@Enum TFhirProcedureRequestPriority
    The priority of the request
  }
  TFhirProcedureRequestPriority = (
    ProcedureRequestPriorityNull,  {@enum.value ProcedureRequestPriorityNull Value is missing from Instance }
    ProcedureRequestPriorityRoutine, {@enum.value ProcedureRequestPriorityRoutine The request has a normal priority. }
    ProcedureRequestPriorityUrgent, {@enum.value ProcedureRequestPriorityUrgent The request should be done urgently. }
    ProcedureRequestPriorityStat, {@enum.value ProcedureRequestPriorityStat The request is time-critical. }
    ProcedureRequestPriorityAsap); {@enum.value ProcedureRequestPriorityAsap The request should be acted on as soon as possible. }
  TFhirProcedureRequestPriorityList = set of TFhirProcedureRequestPriority;

  {@Enum TFhirProvenanceEntityRole
    How an entity was used in an activity
  }
  TFhirProvenanceEntityRole = (
    ProvenanceEntityRoleNull,  {@enum.value ProvenanceEntityRoleNull Value is missing from Instance }
    ProvenanceEntityRoleDerivation, {@enum.value ProvenanceEntityRoleDerivation A transformation of an entity into another, an update of an entity resulting in a new one, or the construction of a new entity based on a preexisting entity. }
    ProvenanceEntityRoleRevision, {@enum.value ProvenanceEntityRoleRevision A derivation for which the resulting entity is a revised version of some original. }
    ProvenanceEntityRoleQuotation, {@enum.value ProvenanceEntityRoleQuotation The repeat of (some or all of) an entity, such as text or image, by someone who may or may not be its original author. }
    ProvenanceEntityRoleSource); {@enum.value ProvenanceEntityRoleSource A primary source for a topic refers to something produced by some agent with direct experience and knowledge about the topic, at the time of the topic's study, without benefit from hindsight. }
  TFhirProvenanceEntityRoleList = set of TFhirProvenanceEntityRole;

  {@Enum TFhirQuestionnaireStatus
    Lifecycle status of the questionnaire
  }
  TFhirQuestionnaireStatus = (
    QuestionnaireStatusNull,  {@enum.value QuestionnaireStatusNull Value is missing from Instance }
    QuestionnaireStatusDraft, {@enum.value QuestionnaireStatusDraft This Questionnaire is not ready for official use. }
    QuestionnaireStatusPublished, {@enum.value QuestionnaireStatusPublished This Questionnaire is ready for use. }
    QuestionnaireStatusRetired); {@enum.value QuestionnaireStatusRetired This Questionnaire should no longer be used to gather data. }
  TFhirQuestionnaireStatusList = set of TFhirQuestionnaireStatus;

  {@Enum TFhirAnswerFormat
    The expected format of an answer
  }
  TFhirAnswerFormat = (
    AnswerFormatNull,  {@enum.value AnswerFormatNull Value is missing from Instance }
    AnswerFormatBoolean, {@enum.value AnswerFormatBoolean Answer is a yes/no answer. }
    AnswerFormatDecimal, {@enum.value AnswerFormatDecimal Answer is a floating point number. }
    AnswerFormatInteger, {@enum.value AnswerFormatInteger Answer is an integer. }
    AnswerFormatDate, {@enum.value AnswerFormatDate Answer is a date. }
    AnswerFormatDateTime, {@enum.value AnswerFormatDateTime Answer is a date and time. }
    AnswerFormatInstant, {@enum.value AnswerFormatInstant Answer is a system timestamp. }
    AnswerFormatTime, {@enum.value AnswerFormatTime Answer is a time independent of date. }
    AnswerFormatString, {@enum.value AnswerFormatString Answer is a short (few words to short sentence) free-text entry. }
    AnswerFormatText, {@enum.value AnswerFormatText Answer is a long (potentially multi-paragram) free-text entry. }
    AnswerFormatChoice, {@enum.value AnswerFormatChoice Answer is a choice from a list of options. }
    AnswerFormatOpenChoice, {@enum.value AnswerFormatOpenChoice Answer is a choice from a list of options or a free-text entry. }
    AnswerFormatAttachment, {@enum.value AnswerFormatAttachment Answer is binary content such as a image, PDF, etc. }
    AnswerFormatReference, {@enum.value AnswerFormatReference Answer is a reference to another resource (practitioner, organization, etc.). }
    AnswerFormatQuantity); {@enum.value AnswerFormatQuantity Answer is a combination of a numeric value and unit. }
  TFhirAnswerFormatList = set of TFhirAnswerFormat;

  {@Enum TFhirQuestionnaireAnswersStatus
    Lifecycle status of the questionnaire answers
  }
  TFhirQuestionnaireAnswersStatus = (
    QuestionnaireAnswersStatusNull,  {@enum.value QuestionnaireAnswersStatusNull Value is missing from Instance }
    QuestionnaireAnswersStatusInProgress, {@enum.value QuestionnaireAnswersStatusInProgress This QuestionnaireAnswers has been partially filled out with answers, but changes or additions are still expected to be made to it. }
    QuestionnaireAnswersStatusCompleted, {@enum.value QuestionnaireAnswersStatusCompleted This QuestionnaireAnswers has been filled out with answers, and the current content is regarded as definitive. }
    QuestionnaireAnswersStatusAmended); {@enum.value QuestionnaireAnswersStatusAmended This QuestionnaireAnswers has been filled out with answers, then marked as complete, yet changes or additions have been made to it afterwards. }
  TFhirQuestionnaireAnswersStatusList = set of TFhirQuestionnaireAnswersStatus;

  {@Enum TFhirReferralstatus
    The status of the referral
  }
  TFhirReferralstatus = (
    ReferralstatusNull,  {@enum.value ReferralstatusNull Value is missing from Instance }
    ReferralstatusDraft, {@enum.value ReferralstatusDraft A draft referral that has yet to be send. }
    ReferralstatusSent, {@enum.value ReferralstatusSent The referral has been transmitted, but not yet acknowledged by the recipient. }
    ReferralstatusActive, {@enum.value ReferralstatusActive The referral has been acknowledged by the recipient, and is in the process of being actioned. }
    ReferralstatusCancelled, {@enum.value ReferralstatusCancelled The referral has been cancelled without being completed. For example it is no longer needed. }
    ReferralstatusRefused, {@enum.value ReferralstatusRefused The recipient has declined to accept the referral. }
    ReferralstatusCompleted); {@enum.value ReferralstatusCompleted The referral has been completely actioned. }
  TFhirReferralstatusList = set of TFhirReferralstatus;

  {@Enum TFhirSecurityEventAction
    Indicator for type of action performed during the event that generated the audit.
  }
  TFhirSecurityEventAction = (
    SecurityEventActionNull,  {@enum.value SecurityEventActionNull Value is missing from Instance }
    SecurityEventActionC, {@enum.value SecurityEventActionC Create a new database object, such as Placing an Order. }
    SecurityEventActionR, {@enum.value SecurityEventActionR Display or print data, such as a Doctor Census. }
    SecurityEventActionU, {@enum.value SecurityEventActionU Update data, such as Revise Patient Information. }
    SecurityEventActionD, {@enum.value SecurityEventActionD Delete items, such as a doctor master file record. }
    SecurityEventActionE); {@enum.value SecurityEventActionE Perform a system or application function such as log-on, program execution or use of an object's method, or perform a query/search operation. }
  TFhirSecurityEventActionList = set of TFhirSecurityEventAction;

  {@Enum TFhirSecurityEventOutcome
    Indicates whether the event succeeded or failed
  }
  TFhirSecurityEventOutcome = (
    SecurityEventOutcomeNull,  {@enum.value SecurityEventOutcomeNull Value is missing from Instance }
    SecurityEventOutcome0, {@enum.value SecurityEventOutcome0 The operation completed successfully (whether with warnings or not). }
    SecurityEventOutcome4, {@enum.value SecurityEventOutcome4 The action was not successful due to some kind of catered for error (often equivalent to an HTTP 400 response). }
    SecurityEventOutcome8, {@enum.value SecurityEventOutcome8 The action was not successful due to some kind of unexpected error (often equivalent to an HTTP 500 response). }
    SecurityEventOutcome12); {@enum.value SecurityEventOutcome12 An error of such magnitude occurred that the system is not longer available for use (i.e. the system died). }
  TFhirSecurityEventOutcomeList = set of TFhirSecurityEventOutcome;

  {@Enum TFhirNetworkType
    The type of network access point that originated the audit event
  }
  TFhirNetworkType = (
    NetworkTypeNull,  {@enum.value NetworkTypeNull Value is missing from Instance }
    NetworkType1, {@enum.value NetworkType1 Machine Name, including DNS name. }
    NetworkType2, {@enum.value NetworkType2 IP Address. }
    NetworkType3, {@enum.value NetworkType3 Telephone Number. }
    NetworkType4, {@enum.value NetworkType4 Email address. }
    NetworkType5); {@enum.value NetworkType5 URI (User directory, HTTP-PUT, ftp, etc.). }
  TFhirNetworkTypeList = set of TFhirNetworkType;

  {@Enum TFhirObjectType
    Code for the participant object type being audited
  }
  TFhirObjectType = (
    ObjectTypeNull,  {@enum.value ObjectTypeNull Value is missing from Instance }
    ObjectType1, {@enum.value ObjectType1 Person. }
    ObjectType2, {@enum.value ObjectType2 System Object. }
    ObjectType3, {@enum.value ObjectType3 Organization. }
    ObjectType4); {@enum.value ObjectType4 Other. }
  TFhirObjectTypeList = set of TFhirObjectType;

  {@Enum TFhirObjectRole
    Code representing the functional application role of Participant Object being audited
  }
  TFhirObjectRole = (
    ObjectRoleNull,  {@enum.value ObjectRoleNull Value is missing from Instance }
    ObjectRole1, {@enum.value ObjectRole1 This object is the patient that is the subject of care related to this event.  It is identifiable by patient ID or equivalent.  The patient may be either human or animal. }
    ObjectRole2, {@enum.value ObjectRole2 This is a location identified as related to the event.  This is usually the location where the event took place.  Note that for shipping, the usual events are arrival at a location or departure from a location. }
    ObjectRole3, {@enum.value ObjectRole3 This object is any kind of persistent document created as a result of the event.  This could be a paper report, film, electronic report, DICOM Study, etc.  Issues related to medical records life cycle management are conveyed elsewhere. }
    ObjectRole4, {@enum.value ObjectRole4 A logical object related to the event.  (Deprecated). }
    ObjectRole5, {@enum.value ObjectRole5 This is any configurable file used to control creation of documents.  Examples include the objects maintained by the HL7 Master File transactions, Value Sets, etc. }
    ObjectRole6, {@enum.value ObjectRole6 A human participant not otherwise identified by some other category. }
    ObjectRole7, {@enum.value ObjectRole7 (deprecated). }
    ObjectRole8, {@enum.value ObjectRole8 Typically a licensed person who is providing or performing care related to the event, generally a physician.   The key distinction between doctor and practitioner is with regards to their role, not the licensing.  The doctor is the human who actually performed the work.  The practitioner is the human or organization that is responsible for the work. }
    ObjectRole9, {@enum.value ObjectRole9 A person or system that is being notified as part of the event.  This is relevant in situations where automated systems provide notifications to other parties when an event took place. }
    ObjectRole10, {@enum.value ObjectRole10 Insurance company, or any other organization who accepts responsibility for paying for the healthcare event. }
    ObjectRole11, {@enum.value ObjectRole11 A person or active system object involved in the event with a security role. }
    ObjectRole12, {@enum.value ObjectRole12 A person or system object involved in the event with the authority to modify security roles of other objects. }
    ObjectRole13, {@enum.value ObjectRole13 A passive object, such as a role table, that is relevant to the event. }
    ObjectRole14, {@enum.value ObjectRole14 (deprecated)  Relevant to certain RBAC security methodologies. }
    ObjectRole15, {@enum.value ObjectRole15 Any person or organization responsible for providing care.  This encompasses all forms of care, licensed or otherwise, and all sorts of teams and care groups. Note, the distinction between practitioners and the doctor that actually provided the care to the patient. }
    ObjectRole16, {@enum.value ObjectRole16 The source or destination for data transfer, when it does not match some other role. }
    ObjectRole17, {@enum.value ObjectRole17 A source or destination for data transfer, that acts as an archive, database, or similar role. }
    ObjectRole18, {@enum.value ObjectRole18 An object that holds schedule information.  This could be an appointment book, availability information, etc. }
    ObjectRole19, {@enum.value ObjectRole19 An organization or person that is the recipient of services.  This could be an organization that is buying services for a patient, or a person that is buying services for an animal. }
    ObjectRole20, {@enum.value ObjectRole20 An order, task, work item, procedure step, or other description of work to be performed.  E.g., a particular instance of an MPPS. }
    ObjectRole21, {@enum.value ObjectRole21 A list of jobs or a system that provides lists of jobs.  E.g., an MWL SCP. }
    ObjectRole22, {@enum.value ObjectRole22 (Deprecated). }
    ObjectRole23, {@enum.value ObjectRole23 An object that specifies or controls the routing or delivery of items.  For example, a distribution list is the routing criteria for mail.  The items delivered may be documents, jobs, or other objects. }
    ObjectRole24); {@enum.value ObjectRole24 The contents of a query.  This is used to capture the contents of any kind of query.  For security surveillance purposes knowing the queries being made is very important. }
  TFhirObjectRoleList = set of TFhirObjectRole;

  {@Enum TFhirObjectLifecycle
    Identifier for the data life-cycle stage for the participant object
  }
  TFhirObjectLifecycle = (
    ObjectLifecycleNull,  {@enum.value ObjectLifecycleNull Value is missing from Instance }
    ObjectLifecycle1, {@enum.value ObjectLifecycle1 Origination / Creation. }
    ObjectLifecycle2, {@enum.value ObjectLifecycle2 Import / Copy from original. }
    ObjectLifecycle3, {@enum.value ObjectLifecycle3 Amendment. }
    ObjectLifecycle4, {@enum.value ObjectLifecycle4 Verification. }
    ObjectLifecycle5, {@enum.value ObjectLifecycle5 Translation. }
    ObjectLifecycle6, {@enum.value ObjectLifecycle6 Access / Use. }
    ObjectLifecycle7, {@enum.value ObjectLifecycle7 De-identification. }
    ObjectLifecycle8, {@enum.value ObjectLifecycle8 Aggregation, summarization, derivation. }
    ObjectLifecycle9, {@enum.value ObjectLifecycle9 Report. }
    ObjectLifecycle10, {@enum.value ObjectLifecycle10 Export / Copy to target. }
    ObjectLifecycle11, {@enum.value ObjectLifecycle11 Disclosure. }
    ObjectLifecycle12, {@enum.value ObjectLifecycle12 Receipt of disclosure. }
    ObjectLifecycle13, {@enum.value ObjectLifecycle13 Archiving. }
    ObjectLifecycle14, {@enum.value ObjectLifecycle14 Logical deletion. }
    ObjectLifecycle15); {@enum.value ObjectLifecycle15 Permanent erasure / Physical destruction. }
  TFhirObjectLifecycleList = set of TFhirObjectLifecycle;

  {@Enum TFhirSlotstatus
    The free/busy status of an appointment
  }
  TFhirSlotstatus = (
    SlotstatusNull,  {@enum.value SlotstatusNull Value is missing from Instance }
    SlotstatusBUSY, {@enum.value SlotstatusBUSY Indicates that the time interval is busy because one  or more events have been scheduled for that interval. }
    SlotstatusFREE, {@enum.value SlotstatusFREE Indicates that the time interval is free for scheduling. }
    SlotstatusBUSYUNAVAILABLE, {@enum.value SlotstatusBUSYUNAVAILABLE Indicates that the time interval is busy and that the interval can not be scheduled. }
    SlotstatusBUSYTENTATIVE); {@enum.value SlotstatusBUSYTENTATIVE Indicates that the time interval is busy because one or more events have been tentatively scheduled for that interval. }
  TFhirSlotstatusList = set of TFhirSlotstatus;

  {@Enum TFhirHierarchicalRelationshipType
    Type indicating if this is a parent or child relationship
  }
  TFhirHierarchicalRelationshipType = (
    HierarchicalRelationshipTypeNull,  {@enum.value HierarchicalRelationshipTypeNull Value is missing from Instance }
    HierarchicalRelationshipTypeParent, {@enum.value HierarchicalRelationshipTypeParent The target resource is the parent of the focal specimen resource. }
    HierarchicalRelationshipTypeChild); {@enum.value HierarchicalRelationshipTypeChild The target resource is the child of the focal specimen resource. }
  TFhirHierarchicalRelationshipTypeList = set of TFhirHierarchicalRelationshipType;

  {@Enum TFhirSubscriptionStatus
    The status of a subscription
  }
  TFhirSubscriptionStatus = (
    SubscriptionStatusNull,  {@enum.value SubscriptionStatusNull Value is missing from Instance }
    SubscriptionStatusRequested, {@enum.value SubscriptionStatusRequested The client has requested the subscription, and the server has not yet set it up. }
    SubscriptionStatusActive, {@enum.value SubscriptionStatusActive The subscription is active. }
    SubscriptionStatusError, {@enum.value SubscriptionStatusError The server has an error executing the notification. }
    SubscriptionStatusOff); {@enum.value SubscriptionStatusOff Too many errors have occurred or the subscription has expired. }
  TFhirSubscriptionStatusList = set of TFhirSubscriptionStatus;

  {@Enum TFhirSubscriptionChannelType
    The type of method used to execute a subscription
  }
  TFhirSubscriptionChannelType = (
    SubscriptionChannelTypeNull,  {@enum.value SubscriptionChannelTypeNull Value is missing from Instance }
    SubscriptionChannelTypeRestHook, {@enum.value SubscriptionChannelTypeRestHook The channel is executed by making a post to the URI. If a payload is included, the URL is interpreted as the service base, and an update (PUT) is made. }
    SubscriptionChannelTypeWebsocket, {@enum.value SubscriptionChannelTypeWebsocket The channel is executed by sending a packet across a web socket connection maintained by the client. The URL identifies the websocket, and the client binds to this URL. }
    SubscriptionChannelTypeEmail, {@enum.value SubscriptionChannelTypeEmail The channel is executed by sending an email to the email addressed in the URI (which must be a mailto:). }
    SubscriptionChannelTypeSms, {@enum.value SubscriptionChannelTypeSms The channel is executed by sending an SMS message to the phone number identified in the URL (tel:). }
    SubscriptionChannelTypeMessage); {@enum.value SubscriptionChannelTypeMessage The channel Is executed by sending a message (e.g. a Bundle with a MessageHeader resource etc) to the application identified in the URI. }
  TFhirSubscriptionChannelTypeList = set of TFhirSubscriptionChannelType;

  {@Enum TFhirValuesetSupplyStatus
    Status of the supply
  }
  TFhirValuesetSupplyStatus = (
    ValuesetSupplyStatusNull,  {@enum.value ValuesetSupplyStatusNull Value is missing from Instance }
    ValuesetSupplyStatusRequested, {@enum.value ValuesetSupplyStatusRequested Supply has been requested, but not dispensed. }
    ValuesetSupplyStatusDispensed, {@enum.value ValuesetSupplyStatusDispensed Supply is part of a pharmacy order and has been dispensed. }
    ValuesetSupplyStatusReceived, {@enum.value ValuesetSupplyStatusReceived Supply has been received by the requestor. }
    ValuesetSupplyStatusFailed, {@enum.value ValuesetSupplyStatusFailed The supply will not be completed because the supplier was unable or unwilling to supply the item. }
    ValuesetSupplyStatusCancelled); {@enum.value ValuesetSupplyStatusCancelled The orderer of the supply cancelled the request. }
  TFhirValuesetSupplyStatusList = set of TFhirValuesetSupplyStatus;

  {@Enum TFhirValuesetSupplyDispenseStatus
    Status of the dispense
  }
  TFhirValuesetSupplyDispenseStatus = (
    ValuesetSupplyDispenseStatusNull,  {@enum.value ValuesetSupplyDispenseStatusNull Value is missing from Instance }
    ValuesetSupplyDispenseStatusInProgress, {@enum.value ValuesetSupplyDispenseStatusInProgress Supply has been requested, but not dispensed. }
    ValuesetSupplyDispenseStatusDispensed, {@enum.value ValuesetSupplyDispenseStatusDispensed Supply is part of a pharmacy order and has been dispensed. }
    ValuesetSupplyDispenseStatusAbandoned); {@enum.value ValuesetSupplyDispenseStatusAbandoned Dispensing was not completed. }
  TFhirValuesetSupplyDispenseStatusList = set of TFhirValuesetSupplyDispenseStatus;

  {@Enum TFhirFilterOperator
    The kind of operation to perform as a part of a property based filter
  }
  TFhirFilterOperator = (
    FilterOperatorNull,  {@enum.value FilterOperatorNull Value is missing from Instance }
    FilterOperatorEqual, {@enum.value FilterOperatorEqual The specified property of the code equals the provided value. }
    FilterOperatorIsA, {@enum.value FilterOperatorIsA The specified property of the code has an is-a relationship with the provided value. }
    FilterOperatorIsNotA, {@enum.value FilterOperatorIsNotA The specified property of the code does not have an is-a relationship with the provided value. }
    FilterOperatorRegex, {@enum.value FilterOperatorRegex The specified property of the code  matches the regex specified in the provided value. }
    FilterOperatorIn, {@enum.value FilterOperatorIn The specified property of the code is in the set of codes or concepts specified in the provided value (comma separated list). }
    FilterOperatorNotIn); {@enum.value FilterOperatorNotIn The specified property of the code is not in the set of codes or concepts specified in the provided value (comma separated list). }
  TFhirFilterOperatorList = set of TFhirFilterOperator;

  {@Enum TFhirEyeCodes
    A coded concept listing the eye codes.
  }
  TFhirEyeCodes = (
    EyeCodesNull,  {@enum.value EyeCodesNull Value is missing from Instance }
    EyeCodesRight, {@enum.value EyeCodesRight right eye. }
    EyeCodesLeft); {@enum.value EyeCodesLeft left eye. }
  TFhirEyeCodesList = set of TFhirEyeCodes;

  {@Enum TFhirBaseCodes
    A coded concept listing the base codes.
  }
  TFhirBaseCodes = (
    BaseCodesNull,  {@enum.value BaseCodesNull Value is missing from Instance }
    BaseCodesUp, {@enum.value BaseCodesUp top. }
    BaseCodesDown, {@enum.value BaseCodesDown bottom. }
    BaseCodesIn, {@enum.value BaseCodesIn inner edge. }
    BaseCodesOut); {@enum.value BaseCodesOut outer edge. }
  TFhirBaseCodesList = set of TFhirBaseCodes;

Type
  TFhirElement = class;
  TFhirElementList = class;
  TFhirBackboneElement = class;
  TFhirBackboneElementList = class;
  TFhirEnum = class;
  TFhirEnumList = class;
  TFhirInteger = class;
  TFhirIntegerList = class;
  TFhirDateTime = class;
  TFhirDateTimeList = class;
  TFhirDate = class;
  TFhirDateList = class;
  TFhirDecimal = class;
  TFhirDecimalList = class;
  TFhirUri = class;
  TFhirUriList = class;
  TFhirBase64Binary = class;
  TFhirBase64BinaryList = class;
  TFhirTime = class;
  TFhirTimeList = class;
  TFhirString = class;
  TFhirStringList = class;
  TFhirBoolean = class;
  TFhirBooleanList = class;
  TFhirInstant = class;
  TFhirInstantList = class;
  TFhirCode = class;
  TFhirCodeList = class;
  TFhirId = class;
  TFhirIdList = class;
  TFhirOid = class;
  TFhirOidList = class;
  TFhirUuid = class;
  TFhirUuidList = class;
  TFhirExtension = class;
  TFhirExtensionList = class;
  TFhirNarrative = class;
  TFhirNarrativeList = class;
  TFhirPeriod = class;
  TFhirPeriodList = class;
  TFhirCoding = class;
  TFhirCodingList = class;
  TFhirRange = class;
  TFhirRangeList = class;
  TFhirQuantity = class;
  TFhirQuantityList = class;
  TFhirAttachment = class;
  TFhirAttachmentList = class;
  TFhirRatio = class;
  TFhirRatioList = class;
  TFhirSampledData = class;
  TFhirSampledDataList = class;
  TFhirReference = class;
  TFhirReferenceList = class;
  TFhirCodeableConcept = class;
  TFhirCodeableConceptList = class;
  TFhirIdentifier = class;
  TFhirIdentifierList = class;
  TFhirElementDefinitionSlicing = class;
  TFhirElementDefinitionSlicingList = class;
  TFhirElementDefinitionType = class;
  TFhirElementDefinitionTypeList = class;
  TFhirElementDefinitionConstraint = class;
  TFhirElementDefinitionConstraintList = class;
  TFhirElementDefinitionBinding = class;
  TFhirElementDefinitionBindingList = class;
  TFhirElementDefinitionMapping = class;
  TFhirElementDefinitionMappingList = class;
  TFhirElementDefinition = class;
  TFhirElementDefinitionList = class;
  TFhirTimingRepeat = class;
  TFhirTimingRepeatList = class;
  TFhirTiming = class;
  TFhirTimingList = class;
  TFhirAddress = class;
  TFhirAddressList = class;
  TFhirHumanName = class;
  TFhirHumanNameList = class;
  TFhirContactPoint = class;
  TFhirContactPointList = class;

  {@Class TFhirElement : TFHIRBase
    Base definition for all elements in a resource.
  }
  {!.Net HL7Connect.Fhir.Element}
  TFhirElement = class (TFHIRBase)
  private
    FId : TFhirId;
    FextensionList : TFhirExtensionList;
    Procedure SetId(value : TFhirId);
    Function GetIdST : String;
    Procedure SetIdST(value : String);
    function GetExtensionList : TFhirExtensionList;
    function GetHasExtensionList : Boolean;
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirElement; overload;
    function Clone : TFhirElement; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member id
      Typed access to unique id for the element within a resource (for internal references).
    }
    property id : String read GetIdST write SetIdST;
    {@member idElement
      unique id for the element within a resource (for internal references).
    }
    property idElement : TFhirId read FId write SetId;

    {@member extensionList
      May be used to represent additional information that is not part of the basic definition of the element. In order to make the use of extensions safe and manageable, there is a strict set of governance  applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension.
    }
    property extensionList : TFhirExtensionList read GetExtensionList;
    property hasExtensionList : boolean read GetHasExtensionList;

  end;


  TFhirElementListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirElementList;
    function GetCurrent : TFhirElement;
  public
    Constructor Create(list : TFhirElementList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirElement read GetCurrent;
  end;


  {@Class TFhirElementList
    A list of FhirElement
  }
  {!.Net HL7Connect.Fhir.ElementList}
  TFhirElementList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirElement;
    procedure SetItemN(index : Integer; value : TFhirElement);
  public
    {!script hide}
    function Link : TFhirElementList; Overload;
    function Clone : TFhirElementList; Overload;
    function GetEnumerator : TFhirElementListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirElement to the end of the list.
    }
    function Append : TFhirElement;

    
    {@member AddItem
      Add an already existing FhirElement to the end of the list.
    }
    procedure AddItem(value : TFhirElement); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirElement) : Integer;
    

    {@member Insert
      Insert FhirElement before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirElement;
    

    {@member InsertItem
       Insert an existing FhirElement before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirElement);
    
    {@member Item
       Get the iIndexth FhirElement. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirElement. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirElement);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirElement;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirElements[index : Integer] : TFhirElement read GetItemN write SetItemN; default;
  End;


  {@Class TFhirBackboneElement : TFHIRElement
    Base definition for all elements that are defined inside a resource - but not those in a data type.
  }
  {!.Net HL7Connect.Fhir.BackboneElement}
  TFhirBackboneElement = class (TFHIRElement)
  private
    FmodifierExtensionList : TFhirExtensionList;
    function GetModifierExtensionList : TFhirExtensionList;
    function GetHasModifierExtensionList : Boolean;
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirBackboneElement; overload;
    function Clone : TFhirBackboneElement; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member modifierExtensionList
      May be used to represent additional information that is not part of the basic definition of the element, and that modifies the understanding of the element that contains it. Usually modifier elements provide negation or qualification. In order to make the use of extensions safe and manageable, there is a strict set of governance applied to the definition and use of extensions. Though any implementer is allowed to define an extension, there is a set of requirements that SHALL be met as part of the definition of the extension. Applications processing a resource are required to check for modifier extensions.
    }
    property modifierExtensionList : TFhirExtensionList read GetModifierExtensionList;
    property hasModifierExtensionList : boolean read GetHasModifierExtensionList;

  end;


  TFhirBackboneElementListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirBackboneElementList;
    function GetCurrent : TFhirBackboneElement;
  public
    Constructor Create(list : TFhirBackboneElementList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirBackboneElement read GetCurrent;
  end;


  {@Class TFhirBackboneElementList
    A list of FhirBackboneElement
  }
  {!.Net HL7Connect.Fhir.BackboneElementList}
  TFhirBackboneElementList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirBackboneElement;
    procedure SetItemN(index : Integer; value : TFhirBackboneElement);
  public
    {!script hide}
    function Link : TFhirBackboneElementList; Overload;
    function Clone : TFhirBackboneElementList; Overload;
    function GetEnumerator : TFhirBackboneElementListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirBackboneElement to the end of the list.
    }
    function Append : TFhirBackboneElement;

    
    {@member AddItem
      Add an already existing FhirBackboneElement to the end of the list.
    }
    procedure AddItem(value : TFhirBackboneElement); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirBackboneElement) : Integer;
    

    {@member Insert
      Insert FhirBackboneElement before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirBackboneElement;
    

    {@member InsertItem
       Insert an existing FhirBackboneElement before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirBackboneElement);
    
    {@member Item
       Get the iIndexth FhirBackboneElement. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirBackboneElement. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirBackboneElement);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirBackboneElement;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirBackboneElements[index : Integer] : TFhirBackboneElement read GetItemN write SetItemN; default;
  End;


  {@Class TFhirType : TFhirElement
    A base FHIR type - (polymorphism support)
  }
  {!.Net HL7Connect.Fhir.Type}
  TFhirType = class (TFhirElement)
  Public
    {!script hide}
    Function Link : TFhirType; Overload;
    Function Clone : TFhirType; Overload;
    {!script show}
  End;
  TFHIRTypeClass = class of TFhirType;
  
  {@Class TFHIRPrimitiveType : TFhirType
    A base FHIR type - (polymorphism support)
  }
  {!.Net HL7Connect.Fhir.Type}
  TFHIRPrimitiveType = class (TFhirType)
  Public
    {!script hide}
    Function Link : TFHIRPrimitiveType; Overload;
    Function Clone : TFHIRPrimitiveType; Overload;
    Function AsStringValue : String; Overload;
    {!script show}
  End;
  TFHIRPrimitiveTypeClass = class of TFHIRPrimitiveType;
  

  {@Class TFhirEnum : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Enum}
  TFhirEnum = class (TFhirPrimitiveType)
  Private
    FValue: String;
    procedure setValue(value: String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirEnum; Overload;
    Function Clone : TFhirEnum; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the enum
    }
    property value : String read FValue write SetValue;
  End;    


  TFhirEnumListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirEnumList;
    function GetCurrent : TFhirEnum;
  public
    Constructor Create(list : TFhirEnumList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirEnum read GetCurrent;
  end;


  {@Class TFhirEnumList
    A list of FhirEnum
  }
  {!.Net HL7Connect.Fhir.EnumList}
  TFhirEnumList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirEnum;
    procedure SetItemN(index : Integer; value : TFhirEnum);
  public
    {!script hide}
    function Link : TFhirEnumList; Overload;
    function Clone : TFhirEnumList; Overload;
    function GetEnumerator : TFhirEnumListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirEnum to the end of the list.
    }
    function Append : TFhirEnum;

    
    {@member AddItem
      Add an already existing FhirEnum to the end of the list.
    }
    procedure AddItem(value : TFhirEnum); overload;

    
    {@member AddItem
      Add an already existing FhirEnum to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirEnum) : Integer;
    

    {@member Insert
      Insert FhirEnum before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirEnum;
    

    {@member InsertItem
       Insert an existing FhirEnum before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirEnum);
    
    {@member Item
       Get the iIndexth FhirEnum. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirEnum. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirEnum);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirEnum;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirEnums[index : Integer] : TFhirEnum read GetItemN write SetItemN; default;
  End;


  {@Class TFhirInteger : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Integer}
  TFhirInteger = class (TFhirPrimitiveType)
  Private
    FValue: String;
    procedure setValue(value: String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirInteger; Overload;
    Function Clone : TFhirInteger; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the integer
    }
    property value : String read FValue write SetValue;
  End;    


  TFhirIntegerListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirIntegerList;
    function GetCurrent : TFhirInteger;
  public
    Constructor Create(list : TFhirIntegerList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirInteger read GetCurrent;
  end;


  {@Class TFhirIntegerList
    A list of FhirInteger
  }
  {!.Net HL7Connect.Fhir.IntegerList}
  TFhirIntegerList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirInteger;
    procedure SetItemN(index : Integer; value : TFhirInteger);
  public
    {!script hide}
    function Link : TFhirIntegerList; Overload;
    function Clone : TFhirIntegerList; Overload;
    function GetEnumerator : TFhirIntegerListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirInteger to the end of the list.
    }
    function Append : TFhirInteger;

    
    {@member AddItem
      Add an already existing FhirInteger to the end of the list.
    }
    procedure AddItem(value : TFhirInteger); overload;

    
    {@member AddItem
      Add an already existing FhirInteger to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirInteger) : Integer;
    

    {@member Insert
      Insert FhirInteger before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirInteger;
    

    {@member InsertItem
       Insert an existing FhirInteger before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirInteger);
    
    {@member Item
       Get the iIndexth FhirInteger. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirInteger. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirInteger);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirInteger;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirIntegers[index : Integer] : TFhirInteger read GetItemN write SetItemN; default;
  End;


  {@Class TFhirDateTime : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.DateTime}
  TFhirDateTime = class (TFhirPrimitiveType)
  Private
    FValue: TDateAndTime;
    procedure setValue(value: TDateAndTime);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : TDateAndTime); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirDateTime; Overload;
    Function Clone : TFhirDateTime; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the dateTime
    }
    property value : TDateAndTime read FValue write SetValue;
  End;    


  TFhirDateTimeListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirDateTimeList;
    function GetCurrent : TFhirDateTime;
  public
    Constructor Create(list : TFhirDateTimeList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirDateTime read GetCurrent;
  end;


  {@Class TFhirDateTimeList
    A list of FhirDateTime
  }
  {!.Net HL7Connect.Fhir.DateTimeList}
  TFhirDateTimeList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirDateTime;
    procedure SetItemN(index : Integer; value : TFhirDateTime);
  public
    {!script hide}
    function Link : TFhirDateTimeList; Overload;
    function Clone : TFhirDateTimeList; Overload;
    function GetEnumerator : TFhirDateTimeListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirDateTime to the end of the list.
    }
    function Append : TFhirDateTime;

    
    {@member AddItem
      Add an already existing FhirDateTime to the end of the list.
    }
    procedure AddItem(value : TFhirDateTime); overload;

    
    {@member AddItem
      Add an already existing FhirDateTime to the end of the list.
    }
    procedure AddItem(value : TDateAndTime); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirDateTime) : Integer;
    

    {@member Insert
      Insert FhirDateTime before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirDateTime;
    

    {@member InsertItem
       Insert an existing FhirDateTime before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirDateTime);
    
    {@member Item
       Get the iIndexth FhirDateTime. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirDateTime. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirDateTime);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirDateTime;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirDateTimes[index : Integer] : TFhirDateTime read GetItemN write SetItemN; default;
  End;


  {@Class TFhirDate : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Date}
  TFhirDate = class (TFhirPrimitiveType)
  Private
    FValue: TDateAndTime;
    procedure setValue(value: TDateAndTime);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : TDateAndTime); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirDate; Overload;
    Function Clone : TFhirDate; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the date
    }
    property value : TDateAndTime read FValue write SetValue;
  End;    


  TFhirDateListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirDateList;
    function GetCurrent : TFhirDate;
  public
    Constructor Create(list : TFhirDateList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirDate read GetCurrent;
  end;


  {@Class TFhirDateList
    A list of FhirDate
  }
  {!.Net HL7Connect.Fhir.DateList}
  TFhirDateList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirDate;
    procedure SetItemN(index : Integer; value : TFhirDate);
  public
    {!script hide}
    function Link : TFhirDateList; Overload;
    function Clone : TFhirDateList; Overload;
    function GetEnumerator : TFhirDateListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirDate to the end of the list.
    }
    function Append : TFhirDate;

    
    {@member AddItem
      Add an already existing FhirDate to the end of the list.
    }
    procedure AddItem(value : TFhirDate); overload;

    
    {@member AddItem
      Add an already existing FhirDate to the end of the list.
    }
    procedure AddItem(value : TDateAndTime); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirDate) : Integer;
    

    {@member Insert
      Insert FhirDate before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirDate;
    

    {@member InsertItem
       Insert an existing FhirDate before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirDate);
    
    {@member Item
       Get the iIndexth FhirDate. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirDate. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirDate);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirDate;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirDates[index : Integer] : TFhirDate read GetItemN write SetItemN; default;
  End;


  {@Class TFhirDecimal : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Decimal}
  TFhirDecimal = class (TFhirPrimitiveType)
  Private
    FValue: String;
    procedure setValue(value: String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirDecimal; Overload;
    Function Clone : TFhirDecimal; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the decimal
    }
    property value : String read FValue write SetValue;
  End;    


  TFhirDecimalListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirDecimalList;
    function GetCurrent : TFhirDecimal;
  public
    Constructor Create(list : TFhirDecimalList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirDecimal read GetCurrent;
  end;


  {@Class TFhirDecimalList
    A list of FhirDecimal
  }
  {!.Net HL7Connect.Fhir.DecimalList}
  TFhirDecimalList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirDecimal;
    procedure SetItemN(index : Integer; value : TFhirDecimal);
  public
    {!script hide}
    function Link : TFhirDecimalList; Overload;
    function Clone : TFhirDecimalList; Overload;
    function GetEnumerator : TFhirDecimalListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirDecimal to the end of the list.
    }
    function Append : TFhirDecimal;

    
    {@member AddItem
      Add an already existing FhirDecimal to the end of the list.
    }
    procedure AddItem(value : TFhirDecimal); overload;

    
    {@member AddItem
      Add an already existing FhirDecimal to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirDecimal) : Integer;
    

    {@member Insert
      Insert FhirDecimal before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirDecimal;
    

    {@member InsertItem
       Insert an existing FhirDecimal before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirDecimal);
    
    {@member Item
       Get the iIndexth FhirDecimal. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirDecimal. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirDecimal);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirDecimal;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirDecimals[index : Integer] : TFhirDecimal read GetItemN write SetItemN; default;
  End;


  {@Class TFhirUri : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Uri}
  TFhirUri = class (TFhirPrimitiveType)
  Private
    FValue: String;
    procedure setValue(value: String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirUri; Overload;
    Function Clone : TFhirUri; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the uri
    }
    property value : String read FValue write SetValue;
  End;    


  TFhirUriListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirUriList;
    function GetCurrent : TFhirUri;
  public
    Constructor Create(list : TFhirUriList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirUri read GetCurrent;
  end;


  {@Class TFhirUriList
    A list of FhirUri
  }
  {!.Net HL7Connect.Fhir.UriList}
  TFhirUriList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirUri;
    procedure SetItemN(index : Integer; value : TFhirUri);
  public
    {!script hide}
    function Link : TFhirUriList; Overload;
    function Clone : TFhirUriList; Overload;
    function GetEnumerator : TFhirUriListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirUri to the end of the list.
    }
    function Append : TFhirUri;

    
    {@member AddItem
      Add an already existing FhirUri to the end of the list.
    }
    procedure AddItem(value : TFhirUri); overload;

    
    {@member AddItem
      Add an already existing FhirUri to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirUri) : Integer;
    

    {@member Insert
      Insert FhirUri before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirUri;
    

    {@member InsertItem
       Insert an existing FhirUri before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirUri);
    
    {@member Item
       Get the iIndexth FhirUri. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirUri. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirUri);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirUri;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirUris[index : Integer] : TFhirUri read GetItemN write SetItemN; default;
  End;


  {@Class TFhirBase64Binary : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Base64Binary}
  TFhirBase64Binary = class (TFhirPrimitiveType)
  Private
    FValue: TBytes;
    procedure setValue(value: TBytes);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : TBytes); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirBase64Binary; Overload;
    Function Clone : TFhirBase64Binary; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the base64Binary
    }
    property value : TBytes read FValue write SetValue;
  End;    


  TFhirBase64BinaryListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirBase64BinaryList;
    function GetCurrent : TFhirBase64Binary;
  public
    Constructor Create(list : TFhirBase64BinaryList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirBase64Binary read GetCurrent;
  end;


  {@Class TFhirBase64BinaryList
    A list of FhirBase64Binary
  }
  {!.Net HL7Connect.Fhir.Base64BinaryList}
  TFhirBase64BinaryList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirBase64Binary;
    procedure SetItemN(index : Integer; value : TFhirBase64Binary);
  public
    {!script hide}
    function Link : TFhirBase64BinaryList; Overload;
    function Clone : TFhirBase64BinaryList; Overload;
    function GetEnumerator : TFhirBase64BinaryListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirBase64Binary to the end of the list.
    }
    function Append : TFhirBase64Binary;

    
    {@member AddItem
      Add an already existing FhirBase64Binary to the end of the list.
    }
    procedure AddItem(value : TFhirBase64Binary); overload;

    
    {@member AddItem
      Add an already existing FhirBase64Binary to the end of the list.
    }
    procedure AddItem(value : TBytes); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirBase64Binary) : Integer;
    

    {@member Insert
      Insert FhirBase64Binary before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirBase64Binary;
    

    {@member InsertItem
       Insert an existing FhirBase64Binary before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirBase64Binary);
    
    {@member Item
       Get the iIndexth FhirBase64Binary. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirBase64Binary. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirBase64Binary);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirBase64Binary;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirBase64Binaries[index : Integer] : TFhirBase64Binary read GetItemN write SetItemN; default;
  End;


  {@Class TFhirTime : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Time}
  TFhirTime = class (TFhirPrimitiveType)
  Private
    FValue: String;
    procedure setValue(value: String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirTime; Overload;
    Function Clone : TFhirTime; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the time
    }
    property value : String read FValue write SetValue;
  End;    


  TFhirTimeListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirTimeList;
    function GetCurrent : TFhirTime;
  public
    Constructor Create(list : TFhirTimeList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirTime read GetCurrent;
  end;


  {@Class TFhirTimeList
    A list of FhirTime
  }
  {!.Net HL7Connect.Fhir.TimeList}
  TFhirTimeList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirTime;
    procedure SetItemN(index : Integer; value : TFhirTime);
  public
    {!script hide}
    function Link : TFhirTimeList; Overload;
    function Clone : TFhirTimeList; Overload;
    function GetEnumerator : TFhirTimeListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirTime to the end of the list.
    }
    function Append : TFhirTime;

    
    {@member AddItem
      Add an already existing FhirTime to the end of the list.
    }
    procedure AddItem(value : TFhirTime); overload;

    
    {@member AddItem
      Add an already existing FhirTime to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirTime) : Integer;
    

    {@member Insert
      Insert FhirTime before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirTime;
    

    {@member InsertItem
       Insert an existing FhirTime before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirTime);
    
    {@member Item
       Get the iIndexth FhirTime. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirTime. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirTime);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirTime;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirTimes[index : Integer] : TFhirTime read GetItemN write SetItemN; default;
  End;


  {@Class TFhirString : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.String}
  TFhirString = class (TFhirPrimitiveType)
  Private
    FValue: String;
    procedure setValue(value: String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirString; Overload;
    Function Clone : TFhirString; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the string
    }
    property value : String read FValue write SetValue;
  End;    


  TFhirStringListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirStringList;
    function GetCurrent : TFhirString;
  public
    Constructor Create(list : TFhirStringList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirString read GetCurrent;
  end;


  {@Class TFhirStringList
    A list of FhirString
  }
  {!.Net HL7Connect.Fhir.StringList}
  TFhirStringList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirString;
    procedure SetItemN(index : Integer; value : TFhirString);
  public
    {!script hide}
    function Link : TFhirStringList; Overload;
    function Clone : TFhirStringList; Overload;
    function GetEnumerator : TFhirStringListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirString to the end of the list.
    }
    function Append : TFhirString;

    
    {@member AddItem
      Add an already existing FhirString to the end of the list.
    }
    procedure AddItem(value : TFhirString); overload;

    
    {@member AddItem
      Add an already existing FhirString to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirString) : Integer;
    

    {@member Insert
      Insert FhirString before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirString;
    

    {@member InsertItem
       Insert an existing FhirString before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirString);
    
    {@member Item
       Get the iIndexth FhirString. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirString. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirString);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirString;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirStrings[index : Integer] : TFhirString read GetItemN write SetItemN; default;
  End;


  {@Class TFhirBoolean : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Boolean}
  TFhirBoolean = class (TFhirPrimitiveType)
  Private
    FValue: Boolean;
    procedure setValue(value: Boolean);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : Boolean); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirBoolean; Overload;
    Function Clone : TFhirBoolean; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the boolean
    }
    property value : Boolean read FValue write SetValue;
  End;    


  TFhirBooleanListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirBooleanList;
    function GetCurrent : TFhirBoolean;
  public
    Constructor Create(list : TFhirBooleanList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirBoolean read GetCurrent;
  end;


  {@Class TFhirBooleanList
    A list of FhirBoolean
  }
  {!.Net HL7Connect.Fhir.BooleanList}
  TFhirBooleanList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirBoolean;
    procedure SetItemN(index : Integer; value : TFhirBoolean);
  public
    {!script hide}
    function Link : TFhirBooleanList; Overload;
    function Clone : TFhirBooleanList; Overload;
    function GetEnumerator : TFhirBooleanListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirBoolean to the end of the list.
    }
    function Append : TFhirBoolean;

    
    {@member AddItem
      Add an already existing FhirBoolean to the end of the list.
    }
    procedure AddItem(value : TFhirBoolean); overload;

    
    {@member AddItem
      Add an already existing FhirBoolean to the end of the list.
    }
    procedure AddItem(value : Boolean); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirBoolean) : Integer;
    

    {@member Insert
      Insert FhirBoolean before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirBoolean;
    

    {@member InsertItem
       Insert an existing FhirBoolean before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirBoolean);
    
    {@member Item
       Get the iIndexth FhirBoolean. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirBoolean. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirBoolean);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirBoolean;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirBooleans[index : Integer] : TFhirBoolean read GetItemN write SetItemN; default;
  End;


  {@Class TFhirInstant : TFhirPrimitiveType
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Instant}
  TFhirInstant = class (TFhirPrimitiveType)
  Private
    FValue: TDateAndTime;
    procedure setValue(value: TDateAndTime);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  Public
    Constructor Create(value : TDateAndTime); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirInstant; Overload;
    Function Clone : TFhirInstant; Overload;
    procedure Assign(oSource : TAdvObject); override;
    function FhirType : string; override;
    {!script show}
  Published
    {@member value
      The actual value of the instant
    }
    property value : TDateAndTime read FValue write SetValue;
  End;    


  TFhirInstantListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirInstantList;
    function GetCurrent : TFhirInstant;
  public
    Constructor Create(list : TFhirInstantList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirInstant read GetCurrent;
  end;


  {@Class TFhirInstantList
    A list of FhirInstant
  }
  {!.Net HL7Connect.Fhir.InstantList}
  TFhirInstantList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirInstant;
    procedure SetItemN(index : Integer; value : TFhirInstant);
  public
    {!script hide}
    function Link : TFhirInstantList; Overload;
    function Clone : TFhirInstantList; Overload;
    function GetEnumerator : TFhirInstantListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirInstant to the end of the list.
    }
    function Append : TFhirInstant;

    
    {@member AddItem
      Add an already existing FhirInstant to the end of the list.
    }
    procedure AddItem(value : TFhirInstant); overload;

    
    {@member AddItem
      Add an already existing FhirInstant to the end of the list.
    }
    procedure AddItem(value : TDateAndTime); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirInstant) : Integer;
    

    {@member Insert
      Insert FhirInstant before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirInstant;
    

    {@member InsertItem
       Insert an existing FhirInstant before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirInstant);
    
    {@member Item
       Get the iIndexth FhirInstant. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirInstant. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirInstant);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirInstant;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirInstants[index : Integer] : TFhirInstant read GetItemN write SetItemN; default;
  End;


  {@Class TFhirCode : TFhirString
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Code}
  TFhirCode = class (TFhirString)
  Private
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirCode; Overload;
    Function Clone : TFhirCode; Overload;
    function FhirType : string; override;
    {!script show}
  End;    


  TFhirCodeListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirCodeList;
    function GetCurrent : TFhirCode;
  public
    Constructor Create(list : TFhirCodeList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirCode read GetCurrent;
  end;


  {@Class TFhirCodeList
    A list of FhirCode
  }
  {!.Net HL7Connect.Fhir.CodeList}
  TFhirCodeList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirCode;
    procedure SetItemN(index : Integer; value : TFhirCode);
  public
    {!script hide}
    function Link : TFhirCodeList; Overload;
    function Clone : TFhirCodeList; Overload;
    function GetEnumerator : TFhirCodeListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirCode to the end of the list.
    }
    function Append : TFhirCode;

    
    {@member AddItem
      Add an already existing FhirCode to the end of the list.
    }
    procedure AddItem(value : TFhirCode); overload;

    
    {@member AddItem
      Add an already existing FhirCode to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirCode) : Integer;
    

    {@member Insert
      Insert FhirCode before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirCode;
    

    {@member InsertItem
       Insert an existing FhirCode before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirCode);
    
    {@member Item
       Get the iIndexth FhirCode. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirCode. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirCode);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirCode;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirCodes[index : Integer] : TFhirCode read GetItemN write SetItemN; default;
  End;


  {@Class TFhirId : TFhirString
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Id}
  TFhirId = class (TFhirString)
  Private
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirId; Overload;
    Function Clone : TFhirId; Overload;
    function FhirType : string; override;
    {!script show}
  End;    


  TFhirIdListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirIdList;
    function GetCurrent : TFhirId;
  public
    Constructor Create(list : TFhirIdList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirId read GetCurrent;
  end;


  {@Class TFhirIdList
    A list of FhirId
  }
  {!.Net HL7Connect.Fhir.IdList}
  TFhirIdList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirId;
    procedure SetItemN(index : Integer; value : TFhirId);
  public
    {!script hide}
    function Link : TFhirIdList; Overload;
    function Clone : TFhirIdList; Overload;
    function GetEnumerator : TFhirIdListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirId to the end of the list.
    }
    function Append : TFhirId;

    
    {@member AddItem
      Add an already existing FhirId to the end of the list.
    }
    procedure AddItem(value : TFhirId); overload;

    
    {@member AddItem
      Add an already existing FhirId to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirId) : Integer;
    

    {@member Insert
      Insert FhirId before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirId;
    

    {@member InsertItem
       Insert an existing FhirId before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirId);
    
    {@member Item
       Get the iIndexth FhirId. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirId. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirId);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirId;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirIds[index : Integer] : TFhirId read GetItemN write SetItemN; default;
  End;


  {@Class TFhirOid : TFhirUri
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Oid}
  TFhirOid = class (TFhirUri)
  Private
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirOid; Overload;
    Function Clone : TFhirOid; Overload;
    function FhirType : string; override;
    {!script show}
  End;    


  TFhirOidListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirOidList;
    function GetCurrent : TFhirOid;
  public
    Constructor Create(list : TFhirOidList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirOid read GetCurrent;
  end;


  {@Class TFhirOidList
    A list of FhirOid
  }
  {!.Net HL7Connect.Fhir.OidList}
  TFhirOidList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirOid;
    procedure SetItemN(index : Integer; value : TFhirOid);
  public
    {!script hide}
    function Link : TFhirOidList; Overload;
    function Clone : TFhirOidList; Overload;
    function GetEnumerator : TFhirOidListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirOid to the end of the list.
    }
    function Append : TFhirOid;

    
    {@member AddItem
      Add an already existing FhirOid to the end of the list.
    }
    procedure AddItem(value : TFhirOid); overload;

    
    {@member AddItem
      Add an already existing FhirOid to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirOid) : Integer;
    

    {@member Insert
      Insert FhirOid before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirOid;
    

    {@member InsertItem
       Insert an existing FhirOid before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirOid);
    
    {@member Item
       Get the iIndexth FhirOid. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirOid. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirOid);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirOid;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirOids[index : Integer] : TFhirOid read GetItemN write SetItemN; default;
  End;


  {@Class TFhirUuid : TFhirUri
    a complex string - has an Id attribute, and a dataAbsentReason.
    
    Used where a FHIR element is a string, and may have a dataAbsentReason
  }
  {!.Net HL7Connect.Fhir.Uuid}
  TFhirUuid = class (TFhirUri)
  Private
  Public
    Constructor Create(value : String); overload;
    Destructor Destroy; override;
    
    {!script hide}
    Function Link : TFhirUuid; Overload;
    Function Clone : TFhirUuid; Overload;
    function FhirType : string; override;
    {!script show}
  End;    


  TFhirUuidListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirUuidList;
    function GetCurrent : TFhirUuid;
  public
    Constructor Create(list : TFhirUuidList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirUuid read GetCurrent;
  end;


  {@Class TFhirUuidList
    A list of FhirUuid
  }
  {!.Net HL7Connect.Fhir.UuidList}
  TFhirUuidList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirUuid;
    procedure SetItemN(index : Integer; value : TFhirUuid);
  public
    {!script hide}
    function Link : TFhirUuidList; Overload;
    function Clone : TFhirUuidList; Overload;
    function GetEnumerator : TFhirUuidListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirUuid to the end of the list.
    }
    function Append : TFhirUuid;

    
    {@member AddItem
      Add an already existing FhirUuid to the end of the list.
    }
    procedure AddItem(value : TFhirUuid); overload;

    
    {@member AddItem
      Add an already existing FhirUuid to the end of the list.
    }
    procedure AddItem(value : String); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirUuid) : Integer;
    

    {@member Insert
      Insert FhirUuid before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirUuid;
    

    {@member InsertItem
       Insert an existing FhirUuid before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirUuid);
    
    {@member Item
       Get the iIndexth FhirUuid. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirUuid. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirUuid);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirUuid;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirUuids[index : Integer] : TFhirUuid read GetItemN write SetItemN; default;
  End;


  {@Class TFhirExtension : TFHIRType
    Optional Extensions Element - found in all resources.
  }
  {!.Net HL7Connect.Fhir.Extension}
  TFhirExtension = class (TFHIRType)
  private
    FUrl : TFhirUri;
    FValue : TFhirType;
    Procedure SetUrl(value : TFhirUri);
    Function GetUrlST : String;
    Procedure SetUrlST(value : String);
    Procedure SetValue(value : TFhirType);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirExtension; overload;
    function Clone : TFhirExtension; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member url
      Typed access to Source of the definition for the extension code - a logical name or a URL.
    }
    property url : String read GetUrlST write SetUrlST;
    {@member urlElement
      Source of the definition for the extension code - a logical name or a URL.
    }
    property urlElement : TFhirUri read FUrl write SetUrl;

    {@member value
      Typed access to Value of extension - may be a resource or one of a constrained set of the data types (see Extensibility in the spec for list). (defined for API consistency)
    }
    property value : TFhirType read FValue write SetValue;
    {@member valueElement
      Value of extension - may be a resource or one of a constrained set of the data types (see Extensibility in the spec for list).
    }
    property valueElement : TFhirType read FValue write SetValue;

  end;


  TFhirExtensionListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirExtensionList;
    function GetCurrent : TFhirExtension;
  public
    Constructor Create(list : TFhirExtensionList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirExtension read GetCurrent;
  end;


  {@Class TFhirExtensionList
    A list of FhirExtension
  }
  {!.Net HL7Connect.Fhir.ExtensionList}
  TFhirExtensionList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirExtension;
    procedure SetItemN(index : Integer; value : TFhirExtension);
  public
    {!script hide}
    function Link : TFhirExtensionList; Overload;
    function Clone : TFhirExtensionList; Overload;
    function GetEnumerator : TFhirExtensionListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirExtension to the end of the list.
    }
    function Append : TFhirExtension;

    
    {@member AddItem
      Add an already existing FhirExtension to the end of the list.
    }
    procedure AddItem(value : TFhirExtension); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirExtension) : Integer;
    

    {@member Insert
      Insert FhirExtension before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirExtension;
    

    {@member InsertItem
       Insert an existing FhirExtension before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirExtension);
    
    {@member Item
       Get the iIndexth FhirExtension. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirExtension. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirExtension);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirExtension;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirExtensions[index : Integer] : TFhirExtension read GetItemN write SetItemN; default;
  End;


  {@Class TFhirNarrative : TFHIRType
    A human-readable formatted text, including images.
  }
  {!.Net HL7Connect.Fhir.Narrative}
  TFhirNarrative = class (TFHIRType)
  private
    FStatus : TFhirEnum;
    FDiv_ : TFhirXHtmlNode;
    Procedure SetStatus(value : TFhirEnum);
    Function GetStatusST : TFhirNarrativeStatus;
    Procedure SetStatusST(value : TFhirNarrativeStatus);
    Procedure SetDiv_(value : TFhirXHtmlNode);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirNarrative; overload;
    function Clone : TFhirNarrative; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member status
      The status of the narrative - whether it's entirely generated (from just the defined data or the extensions too), or whether a human authored it and it may contain additional data.
    }
    property status : TFhirNarrativeStatus read GetStatusST write SetStatusST;
    property statusElement : TFhirEnum read FStatus write SetStatus;

    {@member div_
      Typed access to The actual narrative content, a stripped down version of XHTML. (defined for API consistency)
    }
    property div_ : TFhirXHtmlNode read FDiv_ write SetDiv_;
    {@member div_Element
      The actual narrative content, a stripped down version of XHTML.
    }
    property div_Element : TFhirXHtmlNode read FDiv_ write SetDiv_;

  end;


  TFhirNarrativeListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirNarrativeList;
    function GetCurrent : TFhirNarrative;
  public
    Constructor Create(list : TFhirNarrativeList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirNarrative read GetCurrent;
  end;


  {@Class TFhirNarrativeList
    A list of FhirNarrative
  }
  {!.Net HL7Connect.Fhir.NarrativeList}
  TFhirNarrativeList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirNarrative;
    procedure SetItemN(index : Integer; value : TFhirNarrative);
  public
    {!script hide}
    function Link : TFhirNarrativeList; Overload;
    function Clone : TFhirNarrativeList; Overload;
    function GetEnumerator : TFhirNarrativeListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirNarrative to the end of the list.
    }
    function Append : TFhirNarrative;

    
    {@member AddItem
      Add an already existing FhirNarrative to the end of the list.
    }
    procedure AddItem(value : TFhirNarrative); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirNarrative) : Integer;
    

    {@member Insert
      Insert FhirNarrative before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirNarrative;
    

    {@member InsertItem
       Insert an existing FhirNarrative before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirNarrative);
    
    {@member Item
       Get the iIndexth FhirNarrative. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirNarrative. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirNarrative);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirNarrative;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirNarratives[index : Integer] : TFhirNarrative read GetItemN write SetItemN; default;
  End;


  {@Class TFhirPeriod : TFhirType
    A time period defined by a start and end date and optionally time.
  }
  {!.Net HL7Connect.Fhir.Period}
  TFhirPeriod = class (TFhirType)
  private
    FStart : TFhirDateTime;
    FEnd_ : TFhirDateTime;
    Procedure SetStart(value : TFhirDateTime);
    Function GetStartST : TDateAndTime;
    Procedure SetStartST(value : TDateAndTime);
    Procedure SetEnd_(value : TFhirDateTime);
    Function GetEnd_ST : TDateAndTime;
    Procedure SetEnd_ST(value : TDateAndTime);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirPeriod; overload;
    function Clone : TFhirPeriod; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member start
      Typed access to The start of the period. The boundary is inclusive.
    }
    property start : TDateAndTime read GetStartST write SetStartST;
    {@member startElement
      The start of the period. The boundary is inclusive.
    }
    property startElement : TFhirDateTime read FStart write SetStart;

    {@member end_
      Typed access to The end of the period. If the end of the period is missing, it means that the period is ongoing.
    }
    property end_ : TDateAndTime read GetEnd_ST write SetEnd_ST;
    {@member end_Element
      The end of the period. If the end of the period is missing, it means that the period is ongoing.
    }
    property end_Element : TFhirDateTime read FEnd_ write SetEnd_;

  end;


  TFhirPeriodListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirPeriodList;
    function GetCurrent : TFhirPeriod;
  public
    Constructor Create(list : TFhirPeriodList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirPeriod read GetCurrent;
  end;


  {@Class TFhirPeriodList
    A list of FhirPeriod
  }
  {!.Net HL7Connect.Fhir.PeriodList}
  TFhirPeriodList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirPeriod;
    procedure SetItemN(index : Integer; value : TFhirPeriod);
  public
    {!script hide}
    function Link : TFhirPeriodList; Overload;
    function Clone : TFhirPeriodList; Overload;
    function GetEnumerator : TFhirPeriodListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirPeriod to the end of the list.
    }
    function Append : TFhirPeriod;

    
    {@member AddItem
      Add an already existing FhirPeriod to the end of the list.
    }
    procedure AddItem(value : TFhirPeriod); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirPeriod) : Integer;
    

    {@member Insert
      Insert FhirPeriod before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirPeriod;
    

    {@member InsertItem
       Insert an existing FhirPeriod before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirPeriod);
    
    {@member Item
       Get the iIndexth FhirPeriod. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirPeriod. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirPeriod);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirPeriod;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirPeriods[index : Integer] : TFhirPeriod read GetItemN write SetItemN; default;
  End;


  {@Class TFhirCoding : TFhirType
    A reference to a code defined by a terminology system.
  }
  {!.Net HL7Connect.Fhir.Coding}
  TFhirCoding = class (TFhirType)
  private
    FSystem : TFhirUri;
    FVersion : TFhirString;
    FCode : TFhirCode;
    FDisplay : TFhirString;
    FPrimary : TFhirBoolean;
    FValueSet : TFhirReference{TFhirValueSet};
    Procedure SetSystem(value : TFhirUri);
    Function GetSystemST : String;
    Procedure SetSystemST(value : String);
    Procedure SetVersion(value : TFhirString);
    Function GetVersionST : String;
    Procedure SetVersionST(value : String);
    Procedure SetCode(value : TFhirCode);
    Function GetCodeST : String;
    Procedure SetCodeST(value : String);
    Procedure SetDisplay(value : TFhirString);
    Function GetDisplayST : String;
    Procedure SetDisplayST(value : String);
    Procedure SetPrimary(value : TFhirBoolean);
    Function GetPrimaryST : Boolean;
    Procedure SetPrimaryST(value : Boolean);
    Procedure SetValueSet(value : TFhirReference{TFhirValueSet});
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirCoding; overload;
    function Clone : TFhirCoding; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member system
      Typed access to The identification of the code system that defines the meaning of the symbol in the code.
    }
    property system : String read GetSystemST write SetSystemST;
    {@member systemElement
      The identification of the code system that defines the meaning of the symbol in the code.
    }
    property systemElement : TFhirUri read FSystem write SetSystem;

    {@member version
      Typed access to The version of the code system which was used when choosing this code. Note that a well-maintained code system does not need the version reported, because the meaning of codes is consistent across versions. However this cannot consistently be assured. and when the meaning is not guaranteed to be consistent, the version SHOULD be exchanged.
    }
    property version : String read GetVersionST write SetVersionST;
    {@member versionElement
      The version of the code system which was used when choosing this code. Note that a well-maintained code system does not need the version reported, because the meaning of codes is consistent across versions. However this cannot consistently be assured. and when the meaning is not guaranteed to be consistent, the version SHOULD be exchanged.
    }
    property versionElement : TFhirString read FVersion write SetVersion;

    {@member code
      Typed access to A symbol in syntax defined by the system. The symbol may be a predefined code or an expression in a syntax defined by the coding system (e.g. post-coordination).
    }
    property code : String read GetCodeST write SetCodeST;
    {@member codeElement
      A symbol in syntax defined by the system. The symbol may be a predefined code or an expression in a syntax defined by the coding system (e.g. post-coordination).
    }
    property codeElement : TFhirCode read FCode write SetCode;

    {@member display
      Typed access to A representation of the meaning of the code in the system, following the rules of the system.
    }
    property display : String read GetDisplayST write SetDisplayST;
    {@member displayElement
      A representation of the meaning of the code in the system, following the rules of the system.
    }
    property displayElement : TFhirString read FDisplay write SetDisplay;

    {@member primary
      Typed access to Indicates that this code was chosen by a user directly - i.e. off a pick list of available items (codes or displays).
    }
    property primary : Boolean read GetPrimaryST write SetPrimaryST;
    {@member primaryElement
      Indicates that this code was chosen by a user directly - i.e. off a pick list of available items (codes or displays).
    }
    property primaryElement : TFhirBoolean read FPrimary write SetPrimary;

    {@member valueSet
      Typed access to The set of possible coded values this coding was chosen from or constrained by. (defined for API consistency)
    }
    property valueSet : TFhirReference{TFhirValueSet} read FValueSet write SetValueSet;
    {@member valueSetElement
      The set of possible coded values this coding was chosen from or constrained by.
    }
    property valueSetElement : TFhirReference{TFhirValueSet} read FValueSet write SetValueSet;

  end;


  TFhirCodingListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirCodingList;
    function GetCurrent : TFhirCoding;
  public
    Constructor Create(list : TFhirCodingList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirCoding read GetCurrent;
  end;


  {@Class TFhirCodingList
    A list of FhirCoding
  }
  {!.Net HL7Connect.Fhir.CodingList}
  TFhirCodingList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirCoding;
    procedure SetItemN(index : Integer; value : TFhirCoding);
  public
    {!script hide}
    function Link : TFhirCodingList; Overload;
    function Clone : TFhirCodingList; Overload;
    function GetEnumerator : TFhirCodingListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirCoding to the end of the list.
    }
    function Append : TFhirCoding;

    
    {@member AddItem
      Add an already existing FhirCoding to the end of the list.
    }
    procedure AddItem(value : TFhirCoding); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirCoding) : Integer;
    

    {@member Insert
      Insert FhirCoding before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirCoding;
    

    {@member InsertItem
       Insert an existing FhirCoding before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirCoding);
    
    {@member Item
       Get the iIndexth FhirCoding. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirCoding. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirCoding);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirCoding;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirCodings[index : Integer] : TFhirCoding read GetItemN write SetItemN; default;
  End;


  {@Class TFhirRange : TFhirType
    A set of ordered Quantities defined by a low and high limit.
  }
  {!.Net HL7Connect.Fhir.Range}
  TFhirRange = class (TFhirType)
  private
    FLow : TFhirQuantity;
    FHigh : TFhirQuantity;
    Procedure SetLow(value : TFhirQuantity);
    Procedure SetHigh(value : TFhirQuantity);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirRange; overload;
    function Clone : TFhirRange; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member low
      Typed access to The low limit. The boundary is inclusive. (defined for API consistency)
    }
    property low : TFhirQuantity read FLow write SetLow;
    {@member lowElement
      The low limit. The boundary is inclusive.
    }
    property lowElement : TFhirQuantity read FLow write SetLow;

    {@member high
      Typed access to The high limit. The boundary is inclusive. (defined for API consistency)
    }
    property high : TFhirQuantity read FHigh write SetHigh;
    {@member highElement
      The high limit. The boundary is inclusive.
    }
    property highElement : TFhirQuantity read FHigh write SetHigh;

  end;


  TFhirRangeListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirRangeList;
    function GetCurrent : TFhirRange;
  public
    Constructor Create(list : TFhirRangeList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirRange read GetCurrent;
  end;


  {@Class TFhirRangeList
    A list of FhirRange
  }
  {!.Net HL7Connect.Fhir.RangeList}
  TFhirRangeList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirRange;
    procedure SetItemN(index : Integer; value : TFhirRange);
  public
    {!script hide}
    function Link : TFhirRangeList; Overload;
    function Clone : TFhirRangeList; Overload;
    function GetEnumerator : TFhirRangeListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirRange to the end of the list.
    }
    function Append : TFhirRange;

    
    {@member AddItem
      Add an already existing FhirRange to the end of the list.
    }
    procedure AddItem(value : TFhirRange); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirRange) : Integer;
    

    {@member Insert
      Insert FhirRange before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirRange;
    

    {@member InsertItem
       Insert an existing FhirRange before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirRange);
    
    {@member Item
       Get the iIndexth FhirRange. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirRange. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirRange);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirRange;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirRanges[index : Integer] : TFhirRange read GetItemN write SetItemN; default;
  End;


  {@Class TFhirQuantity : TFhirType
    A measured amount (or an amount that can potentially be measured). Note that measured amounts include amounts that are not precisely quantified, including amounts involving arbitrary units and floating currencies.
  }
  {!.Net HL7Connect.Fhir.Quantity}
  TFhirQuantity = class (TFhirType)
  private
    FValue : TFhirDecimal;
    FComparator : TFhirEnum;
    FUnits : TFhirString;
    FSystem : TFhirUri;
    FCode : TFhirCode;
    Procedure SetValue(value : TFhirDecimal);
    Function GetValueST : String;
    Procedure SetValueST(value : String);
    Procedure SetComparator(value : TFhirEnum);
    Function GetComparatorST : TFhirQuantityComparator;
    Procedure SetComparatorST(value : TFhirQuantityComparator);
    Procedure SetUnits(value : TFhirString);
    Function GetUnitsST : String;
    Procedure SetUnitsST(value : String);
    Procedure SetSystem(value : TFhirUri);
    Function GetSystemST : String;
    Procedure SetSystemST(value : String);
    Procedure SetCode(value : TFhirCode);
    Function GetCodeST : String;
    Procedure SetCodeST(value : String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirQuantity; overload;
    function Clone : TFhirQuantity; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member value
      Typed access to The value of the measured amount. The value includes an implicit precision in the presentation of the value.
    }
    property value : String read GetValueST write SetValueST;
    {@member valueElement
      The value of the measured amount. The value includes an implicit precision in the presentation of the value.
    }
    property valueElement : TFhirDecimal read FValue write SetValue;

    {@member comparator
      How the value should be understood and represented - whether the actual value is greater or less than the stated value due to measurement issues. E.g. if the comparator is "<" , then the real value is < stated value.
    }
    property comparator : TFhirQuantityComparator read GetComparatorST write SetComparatorST;
    property comparatorElement : TFhirEnum read FComparator write SetComparator;

    {@member units
      Typed access to A human-readable form of the units.
    }
    property units : String read GetUnitsST write SetUnitsST;
    {@member unitsElement
      A human-readable form of the units.
    }
    property unitsElement : TFhirString read FUnits write SetUnits;

    {@member system
      Typed access to The identification of the system that provides the coded form of the unit.
    }
    property system : String read GetSystemST write SetSystemST;
    {@member systemElement
      The identification of the system that provides the coded form of the unit.
    }
    property systemElement : TFhirUri read FSystem write SetSystem;

    {@member code
      Typed access to A computer processable form of the units in some unit representation system.
    }
    property code : String read GetCodeST write SetCodeST;
    {@member codeElement
      A computer processable form of the units in some unit representation system.
    }
    property codeElement : TFhirCode read FCode write SetCode;

  end;


  TFhirQuantityListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirQuantityList;
    function GetCurrent : TFhirQuantity;
  public
    Constructor Create(list : TFhirQuantityList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirQuantity read GetCurrent;
  end;


  {@Class TFhirQuantityList
    A list of FhirQuantity
  }
  {!.Net HL7Connect.Fhir.QuantityList}
  TFhirQuantityList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirQuantity;
    procedure SetItemN(index : Integer; value : TFhirQuantity);
  public
    {!script hide}
    function Link : TFhirQuantityList; Overload;
    function Clone : TFhirQuantityList; Overload;
    function GetEnumerator : TFhirQuantityListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirQuantity to the end of the list.
    }
    function Append : TFhirQuantity;

    
    {@member AddItem
      Add an already existing FhirQuantity to the end of the list.
    }
    procedure AddItem(value : TFhirQuantity); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirQuantity) : Integer;
    

    {@member Insert
      Insert FhirQuantity before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirQuantity;
    

    {@member InsertItem
       Insert an existing FhirQuantity before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirQuantity);
    
    {@member Item
       Get the iIndexth FhirQuantity. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirQuantity. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirQuantity);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirQuantity;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirQuantities[index : Integer] : TFhirQuantity read GetItemN write SetItemN; default;
  End;


  {@Class TFhirAttachment : TFhirType
    For referring to data content defined in other formats.
  }
  {!.Net HL7Connect.Fhir.Attachment}
  TFhirAttachment = class (TFhirType)
  private
    FContentType : TFhirCode;
    FLanguage : TFhirCode;
    FData : TFhirBase64Binary;
    FUrl : TFhirUri;
    FSize : TFhirInteger;
    FHash : TFhirBase64Binary;
    FTitle : TFhirString;
    Procedure SetContentType(value : TFhirCode);
    Function GetContentTypeST : String;
    Procedure SetContentTypeST(value : String);
    Procedure SetLanguage(value : TFhirCode);
    Function GetLanguageST : String;
    Procedure SetLanguageST(value : String);
    Procedure SetData(value : TFhirBase64Binary);
    Function GetDataST : TBytes;
    Procedure SetDataST(value : TBytes);
    Procedure SetUrl(value : TFhirUri);
    Function GetUrlST : String;
    Procedure SetUrlST(value : String);
    Procedure SetSize(value : TFhirInteger);
    Function GetSizeST : String;
    Procedure SetSizeST(value : String);
    Procedure SetHash(value : TFhirBase64Binary);
    Function GetHashST : TBytes;
    Procedure SetHashST(value : TBytes);
    Procedure SetTitle(value : TFhirString);
    Function GetTitleST : String;
    Procedure SetTitleST(value : String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirAttachment; overload;
    function Clone : TFhirAttachment; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member contentType
      Typed access to Identifies the type of the data in the attachment and allows a method to be chosen to interpret or render the data. Includes mime type parameters such as charset where appropriate.
    }
    property contentType : String read GetContentTypeST write SetContentTypeST;
    {@member contentTypeElement
      Identifies the type of the data in the attachment and allows a method to be chosen to interpret or render the data. Includes mime type parameters such as charset where appropriate.
    }
    property contentTypeElement : TFhirCode read FContentType write SetContentType;

    {@member language
      Typed access to The human language of the content. The value can be any valid value according to BCP 47.
    }
    property language : String read GetLanguageST write SetLanguageST;
    {@member languageElement
      The human language of the content. The value can be any valid value according to BCP 47.
    }
    property languageElement : TFhirCode read FLanguage write SetLanguage;

    {@member data
      Typed access to The actual data of the attachment - a sequence of bytes. In XML, represented using base64.
    }
    property data : TBytes read GetDataST write SetDataST;
    {@member dataElement
      The actual data of the attachment - a sequence of bytes. In XML, represented using base64.
    }
    property dataElement : TFhirBase64Binary read FData write SetData;

    {@member url
      Typed access to An alternative location where the data can be accessed.
    }
    property url : String read GetUrlST write SetUrlST;
    {@member urlElement
      An alternative location where the data can be accessed.
    }
    property urlElement : TFhirUri read FUrl write SetUrl;

    {@member size
      Typed access to The number of bytes of data that make up this attachment.
    }
    property size : String read GetSizeST write SetSizeST;
    {@member sizeElement
      The number of bytes of data that make up this attachment.
    }
    property sizeElement : TFhirInteger read FSize write SetSize;

    {@member hash
      Typed access to The calculated hash of the data using SHA-1. Represented using base64.
    }
    property hash : TBytes read GetHashST write SetHashST;
    {@member hashElement
      The calculated hash of the data using SHA-1. Represented using base64.
    }
    property hashElement : TFhirBase64Binary read FHash write SetHash;

    {@member title
      Typed access to A label or set of text to display in place of the data.
    }
    property title : String read GetTitleST write SetTitleST;
    {@member titleElement
      A label or set of text to display in place of the data.
    }
    property titleElement : TFhirString read FTitle write SetTitle;

  end;


  TFhirAttachmentListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirAttachmentList;
    function GetCurrent : TFhirAttachment;
  public
    Constructor Create(list : TFhirAttachmentList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirAttachment read GetCurrent;
  end;


  {@Class TFhirAttachmentList
    A list of FhirAttachment
  }
  {!.Net HL7Connect.Fhir.AttachmentList}
  TFhirAttachmentList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirAttachment;
    procedure SetItemN(index : Integer; value : TFhirAttachment);
  public
    {!script hide}
    function Link : TFhirAttachmentList; Overload;
    function Clone : TFhirAttachmentList; Overload;
    function GetEnumerator : TFhirAttachmentListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirAttachment to the end of the list.
    }
    function Append : TFhirAttachment;

    
    {@member AddItem
      Add an already existing FhirAttachment to the end of the list.
    }
    procedure AddItem(value : TFhirAttachment); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirAttachment) : Integer;
    

    {@member Insert
      Insert FhirAttachment before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirAttachment;
    

    {@member InsertItem
       Insert an existing FhirAttachment before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirAttachment);
    
    {@member Item
       Get the iIndexth FhirAttachment. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirAttachment. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirAttachment);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirAttachment;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirAttachments[index : Integer] : TFhirAttachment read GetItemN write SetItemN; default;
  End;


  {@Class TFhirRatio : TFhirType
    A relationship of two Quantity values - expressed as a numerator and a denominator.
  }
  {!.Net HL7Connect.Fhir.Ratio}
  TFhirRatio = class (TFhirType)
  private
    FNumerator : TFhirQuantity;
    FDenominator : TFhirQuantity;
    Procedure SetNumerator(value : TFhirQuantity);
    Procedure SetDenominator(value : TFhirQuantity);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirRatio; overload;
    function Clone : TFhirRatio; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member numerator
      Typed access to The value of the numerator. (defined for API consistency)
    }
    property numerator : TFhirQuantity read FNumerator write SetNumerator;
    {@member numeratorElement
      The value of the numerator.
    }
    property numeratorElement : TFhirQuantity read FNumerator write SetNumerator;

    {@member denominator
      Typed access to The value of the denominator. (defined for API consistency)
    }
    property denominator : TFhirQuantity read FDenominator write SetDenominator;
    {@member denominatorElement
      The value of the denominator.
    }
    property denominatorElement : TFhirQuantity read FDenominator write SetDenominator;

  end;


  TFhirRatioListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirRatioList;
    function GetCurrent : TFhirRatio;
  public
    Constructor Create(list : TFhirRatioList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirRatio read GetCurrent;
  end;


  {@Class TFhirRatioList
    A list of FhirRatio
  }
  {!.Net HL7Connect.Fhir.RatioList}
  TFhirRatioList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirRatio;
    procedure SetItemN(index : Integer; value : TFhirRatio);
  public
    {!script hide}
    function Link : TFhirRatioList; Overload;
    function Clone : TFhirRatioList; Overload;
    function GetEnumerator : TFhirRatioListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirRatio to the end of the list.
    }
    function Append : TFhirRatio;

    
    {@member AddItem
      Add an already existing FhirRatio to the end of the list.
    }
    procedure AddItem(value : TFhirRatio); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirRatio) : Integer;
    

    {@member Insert
      Insert FhirRatio before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirRatio;
    

    {@member InsertItem
       Insert an existing FhirRatio before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirRatio);
    
    {@member Item
       Get the iIndexth FhirRatio. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirRatio. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirRatio);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirRatio;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirRatios[index : Integer] : TFhirRatio read GetItemN write SetItemN; default;
  End;


  {@Class TFhirSampledData : TFhirType
    A series of measurements taken by a device, with upper and lower limits. There may be more than one dimension in the data.
  }
  {!.Net HL7Connect.Fhir.SampledData}
  TFhirSampledData = class (TFhirType)
  private
    FOrigin : TFhirQuantity;
    FPeriod : TFhirDecimal;
    FFactor : TFhirDecimal;
    FLowerLimit : TFhirDecimal;
    FUpperLimit : TFhirDecimal;
    FDimensions : TFhirInteger;
    FData : TFhirString;
    Procedure SetOrigin(value : TFhirQuantity);
    Procedure SetPeriod(value : TFhirDecimal);
    Function GetPeriodST : String;
    Procedure SetPeriodST(value : String);
    Procedure SetFactor(value : TFhirDecimal);
    Function GetFactorST : String;
    Procedure SetFactorST(value : String);
    Procedure SetLowerLimit(value : TFhirDecimal);
    Function GetLowerLimitST : String;
    Procedure SetLowerLimitST(value : String);
    Procedure SetUpperLimit(value : TFhirDecimal);
    Function GetUpperLimitST : String;
    Procedure SetUpperLimitST(value : String);
    Procedure SetDimensions(value : TFhirInteger);
    Function GetDimensionsST : String;
    Procedure SetDimensionsST(value : String);
    Procedure SetData(value : TFhirString);
    Function GetDataST : String;
    Procedure SetDataST(value : String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirSampledData; overload;
    function Clone : TFhirSampledData; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member origin
      Typed access to The base quantity that a measured value of zero represents. In addition, this provides the units of the entire measurement series. (defined for API consistency)
    }
    property origin : TFhirQuantity read FOrigin write SetOrigin;
    {@member originElement
      The base quantity that a measured value of zero represents. In addition, this provides the units of the entire measurement series.
    }
    property originElement : TFhirQuantity read FOrigin write SetOrigin;

    {@member period
      Typed access to The length of time between sampling times, measured in milliseconds.
    }
    property period : String read GetPeriodST write SetPeriodST;
    {@member periodElement
      The length of time between sampling times, measured in milliseconds.
    }
    property periodElement : TFhirDecimal read FPeriod write SetPeriod;

    {@member factor
      Typed access to A correction factor that is applied to the sampled data points before they are added to the origin.
    }
    property factor : String read GetFactorST write SetFactorST;
    {@member factorElement
      A correction factor that is applied to the sampled data points before they are added to the origin.
    }
    property factorElement : TFhirDecimal read FFactor write SetFactor;

    {@member lowerLimit
      Typed access to The lower limit of detection of the measured points. This is needed if any of the data points have the value "L" (lower than detection limit).
    }
    property lowerLimit : String read GetLowerLimitST write SetLowerLimitST;
    {@member lowerLimitElement
      The lower limit of detection of the measured points. This is needed if any of the data points have the value "L" (lower than detection limit).
    }
    property lowerLimitElement : TFhirDecimal read FLowerLimit write SetLowerLimit;

    {@member upperLimit
      Typed access to The upper limit of detection of the measured points. This is needed if any of the data points have the value "U" (higher than detection limit).
    }
    property upperLimit : String read GetUpperLimitST write SetUpperLimitST;
    {@member upperLimitElement
      The upper limit of detection of the measured points. This is needed if any of the data points have the value "U" (higher than detection limit).
    }
    property upperLimitElement : TFhirDecimal read FUpperLimit write SetUpperLimit;

    {@member dimensions
      Typed access to The number of sample points at each time point. If this value is greater than one, then the dimensions will be interlaced - all the sample points for a point in time will be recorded at once.
    }
    property dimensions : String read GetDimensionsST write SetDimensionsST;
    {@member dimensionsElement
      The number of sample points at each time point. If this value is greater than one, then the dimensions will be interlaced - all the sample points for a point in time will be recorded at once.
    }
    property dimensionsElement : TFhirInteger read FDimensions write SetDimensions;

    {@member data
      Typed access to A series of data points which are decimal values separated by a single space (character u20). The special values "E" (error), "L" (below detection limit) and "U" (above detection limit) can also be used in place of a decimal value.
    }
    property data : String read GetDataST write SetDataST;
    {@member dataElement
      A series of data points which are decimal values separated by a single space (character u20). The special values "E" (error), "L" (below detection limit) and "U" (above detection limit) can also be used in place of a decimal value.
    }
    property dataElement : TFhirString read FData write SetData;

  end;


  TFhirSampledDataListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirSampledDataList;
    function GetCurrent : TFhirSampledData;
  public
    Constructor Create(list : TFhirSampledDataList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirSampledData read GetCurrent;
  end;


  {@Class TFhirSampledDataList
    A list of FhirSampledData
  }
  {!.Net HL7Connect.Fhir.SampledDataList}
  TFhirSampledDataList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirSampledData;
    procedure SetItemN(index : Integer; value : TFhirSampledData);
  public
    {!script hide}
    function Link : TFhirSampledDataList; Overload;
    function Clone : TFhirSampledDataList; Overload;
    function GetEnumerator : TFhirSampledDataListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirSampledData to the end of the list.
    }
    function Append : TFhirSampledData;

    
    {@member AddItem
      Add an already existing FhirSampledData to the end of the list.
    }
    procedure AddItem(value : TFhirSampledData); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirSampledData) : Integer;
    

    {@member Insert
      Insert FhirSampledData before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirSampledData;
    

    {@member InsertItem
       Insert an existing FhirSampledData before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirSampledData);
    
    {@member Item
       Get the iIndexth FhirSampledData. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirSampledData. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirSampledData);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirSampledData;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirSampledData[index : Integer] : TFhirSampledData read GetItemN write SetItemN; default;
  End;


  {@Class TFhirReference : TFhirType
    A reference from one resource to another.
  }
  {!.Net HL7Connect.Fhir.Reference}
  TFhirReference = class (TFhirType)
  private
    FReference : TFhirString;
    FDisplay : TFhirString;
    Procedure SetReference(value : TFhirString);
    Function GetReferenceST : String;
    Procedure SetReferenceST(value : String);
    Procedure SetDisplay(value : TFhirString);
    Function GetDisplayST : String;
    Procedure SetDisplayST(value : String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirReference; overload;
    function Clone : TFhirReference; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member reference
      Typed access to A reference to a location at which the other resource is found. The reference may a relative reference, in which case it is relative to the service base URL, or an absolute URL that resolves to the location where the resource is found. The reference may be version specific or not. If the reference is not to a FHIR RESTful server, then it should be assumed to be version specific. Internal fragment references (start with '#') refer to contained resources.
    }
    property reference : String read GetReferenceST write SetReferenceST;
    {@member referenceElement
      A reference to a location at which the other resource is found. The reference may a relative reference, in which case it is relative to the service base URL, or an absolute URL that resolves to the location where the resource is found. The reference may be version specific or not. If the reference is not to a FHIR RESTful server, then it should be assumed to be version specific. Internal fragment references (start with '#') refer to contained resources.
    }
    property referenceElement : TFhirString read FReference write SetReference;

    {@member display
      Typed access to Plain text narrative that identifies the resource in addition to the resource reference.
    }
    property display : String read GetDisplayST write SetDisplayST;
    {@member displayElement
      Plain text narrative that identifies the resource in addition to the resource reference.
    }
    property displayElement : TFhirString read FDisplay write SetDisplay;

  end;


  TFhirReferenceListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirReferenceList;
    function GetCurrent : TFhirReference;
  public
    Constructor Create(list : TFhirReferenceList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirReference read GetCurrent;
  end;


  {@Class TFhirReferenceList
    A list of FhirReference
  }
  {!.Net HL7Connect.Fhir.ReferenceList}
  TFhirReferenceList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirReference;
    procedure SetItemN(index : Integer; value : TFhirReference);
  public
    {!script hide}
    function Link : TFhirReferenceList; Overload;
    function Clone : TFhirReferenceList; Overload;
    function GetEnumerator : TFhirReferenceListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirReference to the end of the list.
    }
    function Append : TFhirReference;

    
    {@member AddItem
      Add an already existing FhirReference to the end of the list.
    }
    procedure AddItem(value : TFhirReference); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirReference) : Integer;
    

    {@member Insert
      Insert FhirReference before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirReference;
    

    {@member InsertItem
       Insert an existing FhirReference before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirReference);
    
    {@member Item
       Get the iIndexth FhirReference. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirReference. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirReference);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirReference;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirReferences[index : Integer] : TFhirReference read GetItemN write SetItemN; default;
  End;


  {@Class TFhirCodeableConcept : TFhirType
    A concept that may be defined by a formal reference to a terminology or ontology or may be provided by text.
  }
  {!.Net HL7Connect.Fhir.CodeableConcept}
  TFhirCodeableConcept = class (TFhirType)
  private
    FcodingList : TFhirCodingList;
    FText : TFhirString;
    function GetCodingList : TFhirCodingList;
    function GetHasCodingList : Boolean;
    Procedure SetText(value : TFhirString);
    Function GetTextST : String;
    Procedure SetTextST(value : String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirCodeableConcept; overload;
    function Clone : TFhirCodeableConcept; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member codingList
      A reference to a code defined by a terminology system.
    }
    property codingList : TFhirCodingList read GetCodingList;
    property hasCodingList : boolean read GetHasCodingList;

    {@member text
      Typed access to A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user.
    }
    property text : String read GetTextST write SetTextST;
    {@member textElement
      A human language representation of the concept as seen/selected/uttered by the user who entered the data and/or which represents the intended meaning of the user.
    }
    property textElement : TFhirString read FText write SetText;

  end;


  TFhirCodeableConceptListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirCodeableConceptList;
    function GetCurrent : TFhirCodeableConcept;
  public
    Constructor Create(list : TFhirCodeableConceptList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirCodeableConcept read GetCurrent;
  end;


  {@Class TFhirCodeableConceptList
    A list of FhirCodeableConcept
  }
  {!.Net HL7Connect.Fhir.CodeableConceptList}
  TFhirCodeableConceptList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirCodeableConcept;
    procedure SetItemN(index : Integer; value : TFhirCodeableConcept);
  public
    {!script hide}
    function Link : TFhirCodeableConceptList; Overload;
    function Clone : TFhirCodeableConceptList; Overload;
    function GetEnumerator : TFhirCodeableConceptListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirCodeableConcept to the end of the list.
    }
    function Append : TFhirCodeableConcept;

    
    {@member AddItem
      Add an already existing FhirCodeableConcept to the end of the list.
    }
    procedure AddItem(value : TFhirCodeableConcept); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirCodeableConcept) : Integer;
    

    {@member Insert
      Insert FhirCodeableConcept before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirCodeableConcept;
    

    {@member InsertItem
       Insert an existing FhirCodeableConcept before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirCodeableConcept);
    
    {@member Item
       Get the iIndexth FhirCodeableConcept. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirCodeableConcept. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirCodeableConcept);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirCodeableConcept;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirCodeableConcepts[index : Integer] : TFhirCodeableConcept read GetItemN write SetItemN; default;
  End;


  {@Class TFhirIdentifier : TFhirType
    A technical identifier - identifies some entity uniquely and unambiguously.
  }
  {!.Net HL7Connect.Fhir.Identifier}
  TFhirIdentifier = class (TFhirType)
  private
    FUse : TFhirEnum;
    FLabel_ : TFhirString;
    FSystem : TFhirUri;
    FValue : TFhirString;
    FPeriod : TFhirPeriod;
    FAssigner : TFhirReference{TFhirOrganization};
    Procedure SetUse(value : TFhirEnum);
    Function GetUseST : TFhirIdentifierUse;
    Procedure SetUseST(value : TFhirIdentifierUse);
    Procedure SetLabel_(value : TFhirString);
    Function GetLabel_ST : String;
    Procedure SetLabel_ST(value : String);
    Procedure SetSystem(value : TFhirUri);
    Function GetSystemST : String;
    Procedure SetSystemST(value : String);
    Procedure SetValue(value : TFhirString);
    Function GetValueST : String;
    Procedure SetValueST(value : String);
    Procedure SetPeriod(value : TFhirPeriod);
    Procedure SetAssigner(value : TFhirReference{TFhirOrganization});
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirIdentifier; overload;
    function Clone : TFhirIdentifier; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member use
      The purpose of this identifier.
    }
    property use : TFhirIdentifierUse read GetUseST write SetUseST;
    property useElement : TFhirEnum read FUse write SetUse;

    {@member label_
      Typed access to A text string for the identifier that can be displayed to a human so they can recognize the identifier.
    }
    property label_ : String read GetLabel_ST write SetLabel_ST;
    {@member label_Element
      A text string for the identifier that can be displayed to a human so they can recognize the identifier.
    }
    property label_Element : TFhirString read FLabel_ write SetLabel_;

    {@member system
      Typed access to Establishes the namespace in which set of possible id values is unique.
    }
    property system : String read GetSystemST write SetSystemST;
    {@member systemElement
      Establishes the namespace in which set of possible id values is unique.
    }
    property systemElement : TFhirUri read FSystem write SetSystem;

    {@member value
      Typed access to The portion of the identifier typically displayed to the user and which is unique within the context of the system.
    }
    property value : String read GetValueST write SetValueST;
    {@member valueElement
      The portion of the identifier typically displayed to the user and which is unique within the context of the system.
    }
    property valueElement : TFhirString read FValue write SetValue;

    {@member period
      Typed access to Time period during which identifier is/was valid for use. (defined for API consistency)
    }
    property period : TFhirPeriod read FPeriod write SetPeriod;
    {@member periodElement
      Time period during which identifier is/was valid for use.
    }
    property periodElement : TFhirPeriod read FPeriod write SetPeriod;

    {@member assigner
      Typed access to Organization that issued/manages the identifier. (defined for API consistency)
    }
    property assigner : TFhirReference{TFhirOrganization} read FAssigner write SetAssigner;
    {@member assignerElement
      Organization that issued/manages the identifier.
    }
    property assignerElement : TFhirReference{TFhirOrganization} read FAssigner write SetAssigner;

  end;


  TFhirIdentifierListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirIdentifierList;
    function GetCurrent : TFhirIdentifier;
  public
    Constructor Create(list : TFhirIdentifierList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirIdentifier read GetCurrent;
  end;


  {@Class TFhirIdentifierList
    A list of FhirIdentifier
  }
  {!.Net HL7Connect.Fhir.IdentifierList}
  TFhirIdentifierList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirIdentifier;
    procedure SetItemN(index : Integer; value : TFhirIdentifier);
  public
    {!script hide}
    function Link : TFhirIdentifierList; Overload;
    function Clone : TFhirIdentifierList; Overload;
    function GetEnumerator : TFhirIdentifierListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirIdentifier to the end of the list.
    }
    function Append : TFhirIdentifier;

    
    {@member AddItem
      Add an already existing FhirIdentifier to the end of the list.
    }
    procedure AddItem(value : TFhirIdentifier); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirIdentifier) : Integer;
    

    {@member Insert
      Insert FhirIdentifier before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirIdentifier;
    

    {@member InsertItem
       Insert an existing FhirIdentifier before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirIdentifier);
    
    {@member Item
       Get the iIndexth FhirIdentifier. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirIdentifier. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirIdentifier);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirIdentifier;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirIdentifiers[index : Integer] : TFhirIdentifier read GetItemN write SetItemN; default;
  End;


  {@Class TFhirElementDefinitionSlicing : TFhirElement
    Indicates that the element is sliced into a set of alternative definitions (there are multiple definitions on a single element in the base resource). The set of slices is any elements that come after this in the element sequence that have the same path, until a shorter path occurs (the shorter path terminates the set).
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionSlicing}
  TFhirElementDefinitionSlicing = class (TFhirElement)
  private
    FdiscriminatorList : TFhirStringList;
    FDescription : TFhirString;
    FOrdered : TFhirBoolean;
    FRules : TFhirEnum;
    function GetDiscriminatorList : TFhirStringList;
    function GetHasDiscriminatorList : Boolean;
    Procedure SetDescription(value : TFhirString);
    Function GetDescriptionST : String;
    Procedure SetDescriptionST(value : String);
    Procedure SetOrdered(value : TFhirBoolean);
    Function GetOrderedST : Boolean;
    Procedure SetOrderedST(value : Boolean);
    Procedure SetRules(value : TFhirEnum);
    Function GetRulesST : TFhirResourceSlicingRules;
    Procedure SetRulesST(value : TFhirResourceSlicingRules);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirElementDefinitionSlicing; overload;
    function Clone : TFhirElementDefinitionSlicing; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member discriminatorList
      Designates which child elements are used to discriminate between the slices when processing an instance. If one or more discriminators are provided, the value of the child elements in the instance data SHALL completely distinguish which slice the element in the resource matches based on the allowed values for those elements in each of the slices.
    }
    property discriminatorList : TFhirStringList read GetDiscriminatorList;
    property hasDiscriminatorList : boolean read GetHasDiscriminatorList;

    {@member description
      Typed access to A humane readable text description of how the slicing works. If there is no discriminator, this is required to be present to provide whatever information is possible about how the slices can be differentiated.
    }
    property description : String read GetDescriptionST write SetDescriptionST;
    {@member descriptionElement
      A humane readable text description of how the slicing works. If there is no discriminator, this is required to be present to provide whatever information is possible about how the slices can be differentiated.
    }
    property descriptionElement : TFhirString read FDescription write SetDescription;

    {@member ordered
      Typed access to If the matching elements have to occur in the same order as defined in the profile.
    }
    property ordered : Boolean read GetOrderedST write SetOrderedST;
    {@member orderedElement
      If the matching elements have to occur in the same order as defined in the profile.
    }
    property orderedElement : TFhirBoolean read FOrdered write SetOrdered;

    {@member rules
      Whether additional slices are allowed or not. When the slices are ordered, profile authors can also say that additional slices are only allowed at the end.
    }
    property rules : TFhirResourceSlicingRules read GetRulesST write SetRulesST;
    property rulesElement : TFhirEnum read FRules write SetRules;

  end;


  TFhirElementDefinitionSlicingListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirElementDefinitionSlicingList;
    function GetCurrent : TFhirElementDefinitionSlicing;
  public
    Constructor Create(list : TFhirElementDefinitionSlicingList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirElementDefinitionSlicing read GetCurrent;
  end;


  {@Class TFhirElementDefinitionSlicingList
    A list of FhirElementDefinitionSlicing
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionSlicingList}
  TFhirElementDefinitionSlicingList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirElementDefinitionSlicing;
    procedure SetItemN(index : Integer; value : TFhirElementDefinitionSlicing);
  public
    {!script hide}
    function Link : TFhirElementDefinitionSlicingList; Overload;
    function Clone : TFhirElementDefinitionSlicingList; Overload;
    function GetEnumerator : TFhirElementDefinitionSlicingListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirElementDefinitionSlicing to the end of the list.
    }
    function Append : TFhirElementDefinitionSlicing;

    
    {@member AddItem
      Add an already existing FhirElementDefinitionSlicing to the end of the list.
    }
    procedure AddItem(value : TFhirElementDefinitionSlicing); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirElementDefinitionSlicing) : Integer;
    

    {@member Insert
      Insert FhirElementDefinitionSlicing before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirElementDefinitionSlicing;
    

    {@member InsertItem
       Insert an existing FhirElementDefinitionSlicing before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirElementDefinitionSlicing);
    
    {@member Item
       Get the iIndexth FhirElementDefinitionSlicing. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirElementDefinitionSlicing. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirElementDefinitionSlicing);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirElementDefinitionSlicing;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirElementDefinitionSlicings[index : Integer] : TFhirElementDefinitionSlicing read GetItemN write SetItemN; default;
  End;


  {@Class TFhirElementDefinitionType : TFhirElement
    The data type or resource that the value of this element is permitted to be.
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionType}
  TFhirElementDefinitionType = class (TFhirElement)
  private
    FCode : TFhirCode;
    FProfile : TFhirUri;
    FAggregation : TFhirEnumList;
    Procedure SetCode(value : TFhirCode);
    Function GetCodeST : String;
    Procedure SetCodeST(value : String);
    Procedure SetProfile(value : TFhirUri);
    Function GetProfileST : String;
    Procedure SetProfileST(value : String);
    function GetAggregation : TFhirEnumList;
    function GetHasAggregation : Boolean;
    Function GetAggregationST : TFhirResourceAggregationModeList;
    Procedure SetAggregationST(value : TFhirResourceAggregationModeList);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirElementDefinitionType; overload;
    function Clone : TFhirElementDefinitionType; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member code
      Typed access to Name of Data type or Resource that is a(or the) type used for this element.
    }
    property code : String read GetCodeST write SetCodeST;
    {@member codeElement
      Name of Data type or Resource that is a(or the) type used for this element.
    }
    property codeElement : TFhirCode read FCode write SetCode;

    {@member profile
      Typed access to Identifies a profile structure that SHALL hold for resources or datatypes referenced as the type of this element. Can be a local reference - to another structure in this profile, or a reference to a structure in another profile.
    }
    property profile : String read GetProfileST write SetProfileST;
    {@member profileElement
      Identifies a profile structure that SHALL hold for resources or datatypes referenced as the type of this element. Can be a local reference - to another structure in this profile, or a reference to a structure in another profile.
    }
    property profileElement : TFhirUri read FProfile write SetProfile;

    {@member aggregation
      If the type is a reference to another resource, how the resource is or can be aggreated - is it a contained resource, or a reference, and if the context is a bundle, is it included in the bundle.
    }
    property aggregation : TFhirResourceAggregationModeList read GetAggregationST write SetAggregationST;
    property aggregationElement : TFhirEnumList read GetAggregation;
    property hasAggregation : boolean read GetHasAggregation;
  end;


  TFhirElementDefinitionTypeListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirElementDefinitionTypeList;
    function GetCurrent : TFhirElementDefinitionType;
  public
    Constructor Create(list : TFhirElementDefinitionTypeList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirElementDefinitionType read GetCurrent;
  end;


  {@Class TFhirElementDefinitionTypeList
    A list of FhirElementDefinitionType
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionTypeList}
  TFhirElementDefinitionTypeList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirElementDefinitionType;
    procedure SetItemN(index : Integer; value : TFhirElementDefinitionType);
  public
    {!script hide}
    function Link : TFhirElementDefinitionTypeList; Overload;
    function Clone : TFhirElementDefinitionTypeList; Overload;
    function GetEnumerator : TFhirElementDefinitionTypeListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirElementDefinitionType to the end of the list.
    }
    function Append : TFhirElementDefinitionType;

    
    {@member AddItem
      Add an already existing FhirElementDefinitionType to the end of the list.
    }
    procedure AddItem(value : TFhirElementDefinitionType); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirElementDefinitionType) : Integer;
    

    {@member Insert
      Insert FhirElementDefinitionType before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirElementDefinitionType;
    

    {@member InsertItem
       Insert an existing FhirElementDefinitionType before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirElementDefinitionType);
    
    {@member Item
       Get the iIndexth FhirElementDefinitionType. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirElementDefinitionType. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirElementDefinitionType);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirElementDefinitionType;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirElementDefinitionTypes[index : Integer] : TFhirElementDefinitionType read GetItemN write SetItemN; default;
  End;


  {@Class TFhirElementDefinitionConstraint : TFhirElement
    Formal constraints such as co-occurrence and other constraints that can be computationally evaluated within the context of the instance.
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionConstraint}
  TFhirElementDefinitionConstraint = class (TFhirElement)
  private
    FKey : TFhirId;
    FName : TFhirString;
    FSeverity : TFhirEnum;
    FHuman : TFhirString;
    FXpath : TFhirString;
    Procedure SetKey(value : TFhirId);
    Function GetKeyST : String;
    Procedure SetKeyST(value : String);
    Procedure SetName(value : TFhirString);
    Function GetNameST : String;
    Procedure SetNameST(value : String);
    Procedure SetSeverity(value : TFhirEnum);
    Function GetSeverityST : TFhirConstraintSeverity;
    Procedure SetSeverityST(value : TFhirConstraintSeverity);
    Procedure SetHuman(value : TFhirString);
    Function GetHumanST : String;
    Procedure SetHumanST(value : String);
    Procedure SetXpath(value : TFhirString);
    Function GetXpathST : String;
    Procedure SetXpathST(value : String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirElementDefinitionConstraint; overload;
    function Clone : TFhirElementDefinitionConstraint; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member key
      Typed access to Allows identification of which elements have their cardinalities impacted by the constraint.  Will not be referenced for constraints that do not affect cardinality.
    }
    property key : String read GetKeyST write SetKeyST;
    {@member keyElement
      Allows identification of which elements have their cardinalities impacted by the constraint.  Will not be referenced for constraints that do not affect cardinality.
    }
    property keyElement : TFhirId read FKey write SetKey;

    {@member name
      Typed access to Used to label the constraint in OCL or in short displays incapable of displaying the full human description.
    }
    property name : String read GetNameST write SetNameST;
    {@member nameElement
      Used to label the constraint in OCL or in short displays incapable of displaying the full human description.
    }
    property nameElement : TFhirString read FName write SetName;

    {@member severity
      Identifies the impact constraint violation has on the conformance of the instance.
    }
    property severity : TFhirConstraintSeverity read GetSeverityST write SetSeverityST;
    property severityElement : TFhirEnum read FSeverity write SetSeverity;

    {@member human
      Typed access to Text that can be used to describe the constraint in messages identifying that the constraint has been violated.
    }
    property human : String read GetHumanST write SetHumanST;
    {@member humanElement
      Text that can be used to describe the constraint in messages identifying that the constraint has been violated.
    }
    property humanElement : TFhirString read FHuman write SetHuman;

    {@member xpath
      Typed access to An XPath expression of constraint that can be executed to see if this constraint is met.
    }
    property xpath : String read GetXpathST write SetXpathST;
    {@member xpathElement
      An XPath expression of constraint that can be executed to see if this constraint is met.
    }
    property xpathElement : TFhirString read FXpath write SetXpath;

  end;


  TFhirElementDefinitionConstraintListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirElementDefinitionConstraintList;
    function GetCurrent : TFhirElementDefinitionConstraint;
  public
    Constructor Create(list : TFhirElementDefinitionConstraintList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirElementDefinitionConstraint read GetCurrent;
  end;


  {@Class TFhirElementDefinitionConstraintList
    A list of FhirElementDefinitionConstraint
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionConstraintList}
  TFhirElementDefinitionConstraintList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirElementDefinitionConstraint;
    procedure SetItemN(index : Integer; value : TFhirElementDefinitionConstraint);
  public
    {!script hide}
    function Link : TFhirElementDefinitionConstraintList; Overload;
    function Clone : TFhirElementDefinitionConstraintList; Overload;
    function GetEnumerator : TFhirElementDefinitionConstraintListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirElementDefinitionConstraint to the end of the list.
    }
    function Append : TFhirElementDefinitionConstraint;

    
    {@member AddItem
      Add an already existing FhirElementDefinitionConstraint to the end of the list.
    }
    procedure AddItem(value : TFhirElementDefinitionConstraint); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirElementDefinitionConstraint) : Integer;
    

    {@member Insert
      Insert FhirElementDefinitionConstraint before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirElementDefinitionConstraint;
    

    {@member InsertItem
       Insert an existing FhirElementDefinitionConstraint before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirElementDefinitionConstraint);
    
    {@member Item
       Get the iIndexth FhirElementDefinitionConstraint. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirElementDefinitionConstraint. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirElementDefinitionConstraint);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirElementDefinitionConstraint;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirElementDefinitionConstraints[index : Integer] : TFhirElementDefinitionConstraint read GetItemN write SetItemN; default;
  End;


  {@Class TFhirElementDefinitionBinding : TFhirElement
    Binds to a value set if this element is coded (code, Coding, CodeableConcept).
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionBinding}
  TFhirElementDefinitionBinding = class (TFhirElement)
  private
    FName : TFhirString;
    FIsExtensible : TFhirBoolean;
    FConformance : TFhirEnum;
    FDescription : TFhirString;
    FReference : TFhirType;
    Procedure SetName(value : TFhirString);
    Function GetNameST : String;
    Procedure SetNameST(value : String);
    Procedure SetIsExtensible(value : TFhirBoolean);
    Function GetIsExtensibleST : Boolean;
    Procedure SetIsExtensibleST(value : Boolean);
    Procedure SetConformance(value : TFhirEnum);
    Function GetConformanceST : TFhirBindingConformance;
    Procedure SetConformanceST(value : TFhirBindingConformance);
    Procedure SetDescription(value : TFhirString);
    Function GetDescriptionST : String;
    Procedure SetDescriptionST(value : String);
    Procedure SetReference(value : TFhirType);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirElementDefinitionBinding; overload;
    function Clone : TFhirElementDefinitionBinding; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member name
      Typed access to A descriptive name for this - can be useful for generating implementation artifacts.
    }
    property name : String read GetNameST write SetNameST;
    {@member nameElement
      A descriptive name for this - can be useful for generating implementation artifacts.
    }
    property nameElement : TFhirString read FName write SetName;

    {@member isExtensible
      Typed access to If true, then conformant systems may use additional codes or (where the data type permits) text alone to convey concepts not covered by the set of codes identified in the binding.  If false, then conformant systems are constrained to the provided codes alone.
    }
    property isExtensible : Boolean read GetIsExtensibleST write SetIsExtensibleST;
    {@member isExtensibleElement
      If true, then conformant systems may use additional codes or (where the data type permits) text alone to convey concepts not covered by the set of codes identified in the binding.  If false, then conformant systems are constrained to the provided codes alone.
    }
    property isExtensibleElement : TFhirBoolean read FIsExtensible write SetIsExtensible;

    {@member conformance
      Indicates the degree of conformance expectations associated with this binding.
    }
    property conformance : TFhirBindingConformance read GetConformanceST write SetConformanceST;
    property conformanceElement : TFhirEnum read FConformance write SetConformance;

    {@member description
      Typed access to Describes the intended use of this particular set of codes.
    }
    property description : String read GetDescriptionST write SetDescriptionST;
    {@member descriptionElement
      Describes the intended use of this particular set of codes.
    }
    property descriptionElement : TFhirString read FDescription write SetDescription;

    {@member reference
      Typed access to Points to the value set or external definition that identifies the set of codes to be used. (defined for API consistency)
    }
    property reference : TFhirType read FReference write SetReference;
    {@member referenceElement
      Points to the value set or external definition that identifies the set of codes to be used.
    }
    property referenceElement : TFhirType read FReference write SetReference;

  end;


  TFhirElementDefinitionBindingListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirElementDefinitionBindingList;
    function GetCurrent : TFhirElementDefinitionBinding;
  public
    Constructor Create(list : TFhirElementDefinitionBindingList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirElementDefinitionBinding read GetCurrent;
  end;


  {@Class TFhirElementDefinitionBindingList
    A list of FhirElementDefinitionBinding
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionBindingList}
  TFhirElementDefinitionBindingList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirElementDefinitionBinding;
    procedure SetItemN(index : Integer; value : TFhirElementDefinitionBinding);
  public
    {!script hide}
    function Link : TFhirElementDefinitionBindingList; Overload;
    function Clone : TFhirElementDefinitionBindingList; Overload;
    function GetEnumerator : TFhirElementDefinitionBindingListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirElementDefinitionBinding to the end of the list.
    }
    function Append : TFhirElementDefinitionBinding;

    
    {@member AddItem
      Add an already existing FhirElementDefinitionBinding to the end of the list.
    }
    procedure AddItem(value : TFhirElementDefinitionBinding); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirElementDefinitionBinding) : Integer;
    

    {@member Insert
      Insert FhirElementDefinitionBinding before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirElementDefinitionBinding;
    

    {@member InsertItem
       Insert an existing FhirElementDefinitionBinding before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirElementDefinitionBinding);
    
    {@member Item
       Get the iIndexth FhirElementDefinitionBinding. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirElementDefinitionBinding. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirElementDefinitionBinding);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirElementDefinitionBinding;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirElementDefinitionBindings[index : Integer] : TFhirElementDefinitionBinding read GetItemN write SetItemN; default;
  End;


  {@Class TFhirElementDefinitionMapping : TFhirElement
    Identifies a concept from an external specification that roughly corresponds to this element.
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionMapping}
  TFhirElementDefinitionMapping = class (TFhirElement)
  private
    FIdentity : TFhirId;
    FMap : TFhirString;
    Procedure SetIdentity(value : TFhirId);
    Function GetIdentityST : String;
    Procedure SetIdentityST(value : String);
    Procedure SetMap(value : TFhirString);
    Function GetMapST : String;
    Procedure SetMapST(value : String);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirElementDefinitionMapping; overload;
    function Clone : TFhirElementDefinitionMapping; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member identity
      Typed access to An internal reference to the definition of a mapping.
    }
    property identity : String read GetIdentityST write SetIdentityST;
    {@member identityElement
      An internal reference to the definition of a mapping.
    }
    property identityElement : TFhirId read FIdentity write SetIdentity;

    {@member map
      Typed access to Expresses what part of the target specification corresponds to this element.
    }
    property map : String read GetMapST write SetMapST;
    {@member mapElement
      Expresses what part of the target specification corresponds to this element.
    }
    property mapElement : TFhirString read FMap write SetMap;

  end;


  TFhirElementDefinitionMappingListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirElementDefinitionMappingList;
    function GetCurrent : TFhirElementDefinitionMapping;
  public
    Constructor Create(list : TFhirElementDefinitionMappingList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirElementDefinitionMapping read GetCurrent;
  end;


  {@Class TFhirElementDefinitionMappingList
    A list of FhirElementDefinitionMapping
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionMappingList}
  TFhirElementDefinitionMappingList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirElementDefinitionMapping;
    procedure SetItemN(index : Integer; value : TFhirElementDefinitionMapping);
  public
    {!script hide}
    function Link : TFhirElementDefinitionMappingList; Overload;
    function Clone : TFhirElementDefinitionMappingList; Overload;
    function GetEnumerator : TFhirElementDefinitionMappingListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirElementDefinitionMapping to the end of the list.
    }
    function Append : TFhirElementDefinitionMapping;

    
    {@member AddItem
      Add an already existing FhirElementDefinitionMapping to the end of the list.
    }
    procedure AddItem(value : TFhirElementDefinitionMapping); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirElementDefinitionMapping) : Integer;
    

    {@member Insert
      Insert FhirElementDefinitionMapping before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirElementDefinitionMapping;
    

    {@member InsertItem
       Insert an existing FhirElementDefinitionMapping before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirElementDefinitionMapping);
    
    {@member Item
       Get the iIndexth FhirElementDefinitionMapping. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirElementDefinitionMapping. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirElementDefinitionMapping);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirElementDefinitionMapping;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirElementDefinitionMappings[index : Integer] : TFhirElementDefinitionMapping read GetItemN write SetItemN; default;
  End;


  {@Class TFhirElementDefinition : TFhirType
    Captures constraints on each element within the resource, profile, or extension.
  }
  {!.Net HL7Connect.Fhir.ElementDefinition}
  TFhirElementDefinition = class (TFhirType)
  private
    FPath : TFhirString;
    FRepresentation : TFhirEnumList;
    FName : TFhirString;
    FSlicing : TFhirElementDefinitionSlicing;
    FShort : TFhirString;
    FFormal : TFhirString;
    FComments : TFhirString;
    FRequirements : TFhirString;
    FsynonymList : TFhirStringList;
    FMin : TFhirInteger;
    FMax : TFhirString;
    Ftype_List : TFhirElementDefinitionTypeList;
    FNameReference : TFhirString;
    FDefaultValue : TFhirType;
    FMeaningWhenMissing : TFhirString;
    FFixed : TFhirType;
    FPattern : TFhirType;
    FExample : TFhirType;
    FMaxLength : TFhirInteger;
    FconditionList : TFhirIdList;
    FconstraintList : TFhirElementDefinitionConstraintList;
    FMustSupport : TFhirBoolean;
    FIsModifier : TFhirBoolean;
    FIsSummary : TFhirBoolean;
    FBinding : TFhirElementDefinitionBinding;
    FmappingList : TFhirElementDefinitionMappingList;
    Procedure SetPath(value : TFhirString);
    Function GetPathST : String;
    Procedure SetPathST(value : String);
    function GetRepresentation : TFhirEnumList;
    function GetHasRepresentation : Boolean;
    Function GetRepresentationST : TFhirPropertyRepresentationList;
    Procedure SetRepresentationST(value : TFhirPropertyRepresentationList);
    Procedure SetName(value : TFhirString);
    Function GetNameST : String;
    Procedure SetNameST(value : String);
    Procedure SetSlicing(value : TFhirElementDefinitionSlicing);
    Procedure SetShort(value : TFhirString);
    Function GetShortST : String;
    Procedure SetShortST(value : String);
    Procedure SetFormal(value : TFhirString);
    Function GetFormalST : String;
    Procedure SetFormalST(value : String);
    Procedure SetComments(value : TFhirString);
    Function GetCommentsST : String;
    Procedure SetCommentsST(value : String);
    Procedure SetRequirements(value : TFhirString);
    Function GetRequirementsST : String;
    Procedure SetRequirementsST(value : String);
    function GetSynonymList : TFhirStringList;
    function GetHasSynonymList : Boolean;
    Procedure SetMin(value : TFhirInteger);
    Function GetMinST : String;
    Procedure SetMinST(value : String);
    Procedure SetMax(value : TFhirString);
    Function GetMaxST : String;
    Procedure SetMaxST(value : String);
    function GetType_List : TFhirElementDefinitionTypeList;
    function GetHasType_List : Boolean;
    Procedure SetNameReference(value : TFhirString);
    Function GetNameReferenceST : String;
    Procedure SetNameReferenceST(value : String);
    Procedure SetDefaultValue(value : TFhirType);
    Procedure SetMeaningWhenMissing(value : TFhirString);
    Function GetMeaningWhenMissingST : String;
    Procedure SetMeaningWhenMissingST(value : String);
    Procedure SetFixed(value : TFhirType);
    Procedure SetPattern(value : TFhirType);
    Procedure SetExample(value : TFhirType);
    Procedure SetMaxLength(value : TFhirInteger);
    Function GetMaxLengthST : String;
    Procedure SetMaxLengthST(value : String);
    function GetConditionList : TFhirIdList;
    function GetHasConditionList : Boolean;
    function GetConstraintList : TFhirElementDefinitionConstraintList;
    function GetHasConstraintList : Boolean;
    Procedure SetMustSupport(value : TFhirBoolean);
    Function GetMustSupportST : Boolean;
    Procedure SetMustSupportST(value : Boolean);
    Procedure SetIsModifier(value : TFhirBoolean);
    Function GetIsModifierST : Boolean;
    Procedure SetIsModifierST(value : Boolean);
    Procedure SetIsSummary(value : TFhirBoolean);
    Function GetIsSummaryST : Boolean;
    Procedure SetIsSummaryST(value : Boolean);
    Procedure SetBinding(value : TFhirElementDefinitionBinding);
    function GetMappingList : TFhirElementDefinitionMappingList;
    function GetHasMappingList : Boolean;
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirElementDefinition; overload;
    function Clone : TFhirElementDefinition; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member path
      Typed access to The path identifies the element and is expressed as a "."-separated list of ancestor elements, beginning with the name of the resource or extension.
    }
    property path : String read GetPathST write SetPathST;
    {@member pathElement
      The path identifies the element and is expressed as a "."-separated list of ancestor elements, beginning with the name of the resource or extension.
    }
    property pathElement : TFhirString read FPath write SetPath;

    {@member representation
      Codes that define how this element is represented in instances, when the deviation varies from the normal case.
    }
    property representation : TFhirPropertyRepresentationList read GetRepresentationST write SetRepresentationST;
    property representationElement : TFhirEnumList read GetRepresentation;
    property hasRepresentation : boolean read GetHasRepresentation;
    {@member name
      Typed access to The name of this element definition (to refer to it from other element definitions using ElementDefinition.nameReference). This is a unique name referring to a specific set of constraints applied to this element. One use of this is to provide a name to different slices of the same element.
    }
    property name : String read GetNameST write SetNameST;
    {@member nameElement
      The name of this element definition (to refer to it from other element definitions using ElementDefinition.nameReference). This is a unique name referring to a specific set of constraints applied to this element. One use of this is to provide a name to different slices of the same element.
    }
    property nameElement : TFhirString read FName write SetName;

    {@member slicing
      Typed access to Indicates that the element is sliced into a set of alternative definitions (there are multiple definitions on a single element in the base resource). The set of slices is any elements that come after this in the element sequence that have the same path, until a shorter path occurs (the shorter path terminates the set). (defined for API consistency)
    }
    property slicing : TFhirElementDefinitionSlicing read FSlicing write SetSlicing;
    {@member slicingElement
      Indicates that the element is sliced into a set of alternative definitions (there are multiple definitions on a single element in the base resource). The set of slices is any elements that come after this in the element sequence that have the same path, until a shorter path occurs (the shorter path terminates the set).
    }
    property slicingElement : TFhirElementDefinitionSlicing read FSlicing write SetSlicing;

    {@member short
      Typed access to A concise definition that  is shown in the generated XML format that summarizes profiles (used throughout the specification).
    }
    property short : String read GetShortST write SetShortST;
    {@member shortElement
      A concise definition that  is shown in the generated XML format that summarizes profiles (used throughout the specification).
    }
    property shortElement : TFhirString read FShort write SetShort;

    {@member formal
      Typed access to The definition SHALL be consistent with the base definition, but convey the meaning of the element in the particular context of use of the resource.
    }
    property formal : String read GetFormalST write SetFormalST;
    {@member formalElement
      The definition SHALL be consistent with the base definition, but convey the meaning of the element in the particular context of use of the resource.
    }
    property formalElement : TFhirString read FFormal write SetFormal;

    {@member comments
      Typed access to Comments about the use of the element, including notes about how to use the data properly, exceptions to proper use, etc.
    }
    property comments : String read GetCommentsST write SetCommentsST;
    {@member commentsElement
      Comments about the use of the element, including notes about how to use the data properly, exceptions to proper use, etc.
    }
    property commentsElement : TFhirString read FComments write SetComments;

    {@member requirements
      Typed access to Explains why this element is needed and why it's been constrained as it has.
    }
    property requirements : String read GetRequirementsST write SetRequirementsST;
    {@member requirementsElement
      Explains why this element is needed and why it's been constrained as it has.
    }
    property requirementsElement : TFhirString read FRequirements write SetRequirements;

    {@member synonymList
      Identifies additional names by which this element might also be known.
    }
    property synonymList : TFhirStringList read GetSynonymList;
    property hasSynonymList : boolean read GetHasSynonymList;

    {@member min
      Typed access to The minimum number of times this element SHALL appear in the instance.
    }
    property min : String read GetMinST write SetMinST;
    {@member minElement
      The minimum number of times this element SHALL appear in the instance.
    }
    property minElement : TFhirInteger read FMin write SetMin;

    {@member max
      Typed access to The maximum number of times this element is permitted to appear in the instance.
    }
    property max : String read GetMaxST write SetMaxST;
    {@member maxElement
      The maximum number of times this element is permitted to appear in the instance.
    }
    property maxElement : TFhirString read FMax write SetMax;

    {@member type_List
      The data type or resource that the value of this element is permitted to be.
    }
    property type_List : TFhirElementDefinitionTypeList read GetType_List;
    property hasType_List : boolean read GetHasType_List;

    {@member nameReference
      Typed access to Identifies the name of a slice defined elsewhere in the profile whose constraints should be applied to the current element.
    }
    property nameReference : String read GetNameReferenceST write SetNameReferenceST;
    {@member nameReferenceElement
      Identifies the name of a slice defined elsewhere in the profile whose constraints should be applied to the current element.
    }
    property nameReferenceElement : TFhirString read FNameReference write SetNameReference;

    {@member defaultValue
      Typed access to The value that should be used if there is no value stated in the instance. (defined for API consistency)
    }
    property defaultValue : TFhirType read FDefaultValue write SetDefaultValue;
    {@member defaultValueElement
      The value that should be used if there is no value stated in the instance.
    }
    property defaultValueElement : TFhirType read FDefaultValue write SetDefaultValue;

    {@member meaningWhenMissing
      Typed access to The Implicit meaning that is to be understood when this element is missing.
    }
    property meaningWhenMissing : String read GetMeaningWhenMissingST write SetMeaningWhenMissingST;
    {@member meaningWhenMissingElement
      The Implicit meaning that is to be understood when this element is missing.
    }
    property meaningWhenMissingElement : TFhirString read FMeaningWhenMissing write SetMeaningWhenMissing;

    {@member fixed
      Typed access to Specifies a value that SHALL be exactly the value  for this element in the instance. For purposes of comparison, non-signficant whitespace is ignored, and all values must be an exact match (case and accent sensitive). Missing elements/attributes must also be missing. (defined for API consistency)
    }
    property fixed : TFhirType read FFixed write SetFixed;
    {@member fixedElement
      Specifies a value that SHALL be exactly the value  for this element in the instance. For purposes of comparison, non-signficant whitespace is ignored, and all values must be an exact match (case and accent sensitive). Missing elements/attributes must also be missing.
    }
    property fixedElement : TFhirType read FFixed write SetFixed;

    {@member pattern
      Typed access to Specifies a value that the value in the instance SHALL follow - that is, any value in the pattern must be found in the instance. Other additional values may be found too. This is effectively constraint by example.  The values of elements present in the pattern must match exactly (case-senstive, accent-sensitive, etc.). (defined for API consistency)
    }
    property pattern : TFhirType read FPattern write SetPattern;
    {@member patternElement
      Specifies a value that the value in the instance SHALL follow - that is, any value in the pattern must be found in the instance. Other additional values may be found too. This is effectively constraint by example.  The values of elements present in the pattern must match exactly (case-senstive, accent-sensitive, etc.).
    }
    property patternElement : TFhirType read FPattern write SetPattern;

    {@member example
      Typed access to An example value for this element. (defined for API consistency)
    }
    property example : TFhirType read FExample write SetExample;
    {@member exampleElement
      An example value for this element.
    }
    property exampleElement : TFhirType read FExample write SetExample;

    {@member maxLength
      Typed access to Indicates the maximum length in characters that is permitted to be present in conformant instances and which is expected to be supported by conformant consumers that support the element.
    }
    property maxLength : String read GetMaxLengthST write SetMaxLengthST;
    {@member maxLengthElement
      Indicates the maximum length in characters that is permitted to be present in conformant instances and which is expected to be supported by conformant consumers that support the element.
    }
    property maxLengthElement : TFhirInteger read FMaxLength write SetMaxLength;

    {@member conditionList
      A reference to an invariant that may make additional statements about the cardinality or value in the instance.
    }
    property conditionList : TFhirIdList read GetConditionList;
    property hasConditionList : boolean read GetHasConditionList;

    {@member constraintList
      Formal constraints such as co-occurrence and other constraints that can be computationally evaluated within the context of the instance.
    }
    property constraintList : TFhirElementDefinitionConstraintList read GetConstraintList;
    property hasConstraintList : boolean read GetHasConstraintList;

    {@member mustSupport
      Typed access to If true, conformant resource authors SHALL be capable of providing a value for the element and resource consumers SHALL be capable of extracting and doing something useful with the data element.  If false, the element may be ignored and not supported.
    }
    property mustSupport : Boolean read GetMustSupportST write SetMustSupportST;
    {@member mustSupportElement
      If true, conformant resource authors SHALL be capable of providing a value for the element and resource consumers SHALL be capable of extracting and doing something useful with the data element.  If false, the element may be ignored and not supported.
    }
    property mustSupportElement : TFhirBoolean read FMustSupport write SetMustSupport;

    {@member isModifier
      Typed access to If true, the value of this element affects the interpretation of the element or resource that contains it, and the value of the element cannot be ignored. Typically, this is used for status, negation and qualification codes. The effect of this is that the element cannot be ignored by systems: they SHALL either recognize the element and process it, and/or a pre-determination has been made that it is not relevant to their particular system.
    }
    property isModifier : Boolean read GetIsModifierST write SetIsModifierST;
    {@member isModifierElement
      If true, the value of this element affects the interpretation of the element or resource that contains it, and the value of the element cannot be ignored. Typically, this is used for status, negation and qualification codes. The effect of this is that the element cannot be ignored by systems: they SHALL either recognize the element and process it, and/or a pre-determination has been made that it is not relevant to their particular system.
    }
    property isModifierElement : TFhirBoolean read FIsModifier write SetIsModifier;

    {@member isSummary
      Typed access to Whether the element should be included if a client requests a search with the parameter _summary=true.
    }
    property isSummary : Boolean read GetIsSummaryST write SetIsSummaryST;
    {@member isSummaryElement
      Whether the element should be included if a client requests a search with the parameter _summary=true.
    }
    property isSummaryElement : TFhirBoolean read FIsSummary write SetIsSummary;

    {@member binding
      Typed access to Binds to a value set if this element is coded (code, Coding, CodeableConcept). (defined for API consistency)
    }
    property binding : TFhirElementDefinitionBinding read FBinding write SetBinding;
    {@member bindingElement
      Binds to a value set if this element is coded (code, Coding, CodeableConcept).
    }
    property bindingElement : TFhirElementDefinitionBinding read FBinding write SetBinding;

    {@member mappingList
      Identifies a concept from an external specification that roughly corresponds to this element.
    }
    property mappingList : TFhirElementDefinitionMappingList read GetMappingList;
    property hasMappingList : boolean read GetHasMappingList;

  end;


  TFhirElementDefinitionListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirElementDefinitionList;
    function GetCurrent : TFhirElementDefinition;
  public
    Constructor Create(list : TFhirElementDefinitionList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirElementDefinition read GetCurrent;
  end;


  {@Class TFhirElementDefinitionList
    A list of FhirElementDefinition
  }
  {!.Net HL7Connect.Fhir.ElementDefinitionList}
  TFhirElementDefinitionList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirElementDefinition;
    procedure SetItemN(index : Integer; value : TFhirElementDefinition);
  public
    {!script hide}
    function Link : TFhirElementDefinitionList; Overload;
    function Clone : TFhirElementDefinitionList; Overload;
    function GetEnumerator : TFhirElementDefinitionListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirElementDefinition to the end of the list.
    }
    function Append : TFhirElementDefinition;

    
    {@member AddItem
      Add an already existing FhirElementDefinition to the end of the list.
    }
    procedure AddItem(value : TFhirElementDefinition); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirElementDefinition) : Integer;
    

    {@member Insert
      Insert FhirElementDefinition before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirElementDefinition;
    

    {@member InsertItem
       Insert an existing FhirElementDefinition before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirElementDefinition);
    
    {@member Item
       Get the iIndexth FhirElementDefinition. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirElementDefinition. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirElementDefinition);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirElementDefinition;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirElementDefinitions[index : Integer] : TFhirElementDefinition read GetItemN write SetItemN; default;
  End;


  {@Class TFhirTimingRepeat : TFhirElement
    Identifies a repeating pattern to the intended time periods.
  }
  {!.Net HL7Connect.Fhir.TimingRepeat}
  TFhirTimingRepeat = class (TFhirElement)
  private
    FFrequency : TFhirInteger;
    FWhen : TFhirEnum;
    FDuration : TFhirDecimal;
    FUnits : TFhirEnum;
    FCount : TFhirInteger;
    FEnd_ : TFhirDateTime;
    Procedure SetFrequency(value : TFhirInteger);
    Function GetFrequencyST : String;
    Procedure SetFrequencyST(value : String);
    Procedure SetWhen(value : TFhirEnum);
    Function GetWhenST : TFhirEventTiming;
    Procedure SetWhenST(value : TFhirEventTiming);
    Procedure SetDuration(value : TFhirDecimal);
    Function GetDurationST : String;
    Procedure SetDurationST(value : String);
    Procedure SetUnits(value : TFhirEnum);
    Function GetUnitsST : TFhirUnitsOfTime;
    Procedure SetUnitsST(value : TFhirUnitsOfTime);
    Procedure SetCount(value : TFhirInteger);
    Function GetCountST : String;
    Procedure SetCountST(value : String);
    Procedure SetEnd_(value : TFhirDateTime);
    Function GetEnd_ST : TDateAndTime;
    Procedure SetEnd_ST(value : TDateAndTime);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirTimingRepeat; overload;
    function Clone : TFhirTimingRepeat; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member frequency
      Typed access to Indicates how often the event should occur.
    }
    property frequency : String read GetFrequencyST write SetFrequencyST;
    {@member frequencyElement
      Indicates how often the event should occur.
    }
    property frequencyElement : TFhirInteger read FFrequency write SetFrequency;

    {@member when
      Identifies the occurrence of daily life that determines timing.
    }
    property when : TFhirEventTiming read GetWhenST write SetWhenST;
    property whenElement : TFhirEnum read FWhen write SetWhen;

    {@member duration
      Typed access to How long each repetition should last.
    }
    property duration : String read GetDurationST write SetDurationST;
    {@member durationElement
      How long each repetition should last.
    }
    property durationElement : TFhirDecimal read FDuration write SetDuration;

    {@member units
      The units of time for the duration.
    }
    property units : TFhirUnitsOfTime read GetUnitsST write SetUnitsST;
    property unitsElement : TFhirEnum read FUnits write SetUnits;

    {@member count
      Typed access to A total count of the desired number of repetitions.
    }
    property count : String read GetCountST write SetCountST;
    {@member countElement
      A total count of the desired number of repetitions.
    }
    property countElement : TFhirInteger read FCount write SetCount;

    {@member end_
      Typed access to When to stop repeating the timing schedule.
    }
    property end_ : TDateAndTime read GetEnd_ST write SetEnd_ST;
    {@member end_Element
      When to stop repeating the timing schedule.
    }
    property end_Element : TFhirDateTime read FEnd_ write SetEnd_;

  end;


  TFhirTimingRepeatListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirTimingRepeatList;
    function GetCurrent : TFhirTimingRepeat;
  public
    Constructor Create(list : TFhirTimingRepeatList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirTimingRepeat read GetCurrent;
  end;


  {@Class TFhirTimingRepeatList
    A list of FhirTimingRepeat
  }
  {!.Net HL7Connect.Fhir.TimingRepeatList}
  TFhirTimingRepeatList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirTimingRepeat;
    procedure SetItemN(index : Integer; value : TFhirTimingRepeat);
  public
    {!script hide}
    function Link : TFhirTimingRepeatList; Overload;
    function Clone : TFhirTimingRepeatList; Overload;
    function GetEnumerator : TFhirTimingRepeatListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirTimingRepeat to the end of the list.
    }
    function Append : TFhirTimingRepeat;

    
    {@member AddItem
      Add an already existing FhirTimingRepeat to the end of the list.
    }
    procedure AddItem(value : TFhirTimingRepeat); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirTimingRepeat) : Integer;
    

    {@member Insert
      Insert FhirTimingRepeat before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirTimingRepeat;
    

    {@member InsertItem
       Insert an existing FhirTimingRepeat before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirTimingRepeat);
    
    {@member Item
       Get the iIndexth FhirTimingRepeat. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirTimingRepeat. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirTimingRepeat);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirTimingRepeat;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirTimingRepeats[index : Integer] : TFhirTimingRepeat read GetItemN write SetItemN; default;
  End;


  {@Class TFhirTiming : TFhirType
    Specifies an event that may occur multiple times. Timing schedules are used for to record when things are expected or requested to occur.
  }
  {!.Net HL7Connect.Fhir.Timing}
  TFhirTiming = class (TFhirType)
  private
    FeventList : TFhirPeriodList;
    FRepeat_ : TFhirTimingRepeat;
    function GetEventList : TFhirPeriodList;
    function GetHasEventList : Boolean;
    Procedure SetRepeat_(value : TFhirTimingRepeat);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirTiming; overload;
    function Clone : TFhirTiming; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member eventList
      Identifies specific time periods when the event should occur.
    }
    property eventList : TFhirPeriodList read GetEventList;
    property hasEventList : boolean read GetHasEventList;

    {@member repeat_
      Typed access to Identifies a repeating pattern to the intended time periods. (defined for API consistency)
    }
    property repeat_ : TFhirTimingRepeat read FRepeat_ write SetRepeat_;
    {@member repeat_Element
      Identifies a repeating pattern to the intended time periods.
    }
    property repeat_Element : TFhirTimingRepeat read FRepeat_ write SetRepeat_;

  end;


  TFhirTimingListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirTimingList;
    function GetCurrent : TFhirTiming;
  public
    Constructor Create(list : TFhirTimingList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirTiming read GetCurrent;
  end;


  {@Class TFhirTimingList
    A list of FhirTiming
  }
  {!.Net HL7Connect.Fhir.TimingList}
  TFhirTimingList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirTiming;
    procedure SetItemN(index : Integer; value : TFhirTiming);
  public
    {!script hide}
    function Link : TFhirTimingList; Overload;
    function Clone : TFhirTimingList; Overload;
    function GetEnumerator : TFhirTimingListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirTiming to the end of the list.
    }
    function Append : TFhirTiming;

    
    {@member AddItem
      Add an already existing FhirTiming to the end of the list.
    }
    procedure AddItem(value : TFhirTiming); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirTiming) : Integer;
    

    {@member Insert
      Insert FhirTiming before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirTiming;
    

    {@member InsertItem
       Insert an existing FhirTiming before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirTiming);
    
    {@member Item
       Get the iIndexth FhirTiming. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirTiming. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirTiming);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirTiming;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirTimings[index : Integer] : TFhirTiming read GetItemN write SetItemN; default;
  End;


  {@Class TFhirAddress : TFhirType
    There is a variety of postal address formats defined around the world. This format defines a superset that is the basis for all addresses around the world.
  }
  {!.Net HL7Connect.Fhir.Address}
  TFhirAddress = class (TFhirType)
  private
    FUse : TFhirEnum;
    FText : TFhirString;
    FlineList : TFhirStringList;
    FCity : TFhirString;
    FState : TFhirString;
    FPostalCode : TFhirString;
    FCountry : TFhirString;
    FPeriod : TFhirPeriod;
    Procedure SetUse(value : TFhirEnum);
    Function GetUseST : TFhirAddressUse;
    Procedure SetUseST(value : TFhirAddressUse);
    Procedure SetText(value : TFhirString);
    Function GetTextST : String;
    Procedure SetTextST(value : String);
    function GetLineList : TFhirStringList;
    function GetHasLineList : Boolean;
    Procedure SetCity(value : TFhirString);
    Function GetCityST : String;
    Procedure SetCityST(value : String);
    Procedure SetState(value : TFhirString);
    Function GetStateST : String;
    Procedure SetStateST(value : String);
    Procedure SetPostalCode(value : TFhirString);
    Function GetPostalCodeST : String;
    Procedure SetPostalCodeST(value : String);
    Procedure SetCountry(value : TFhirString);
    Function GetCountryST : String;
    Procedure SetCountryST(value : String);
    Procedure SetPeriod(value : TFhirPeriod);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirAddress; overload;
    function Clone : TFhirAddress; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member use
      The purpose of this address.
    }
    property use : TFhirAddressUse read GetUseST write SetUseST;
    property useElement : TFhirEnum read FUse write SetUse;

    {@member text
      Typed access to A full text representation of the address.
    }
    property text : String read GetTextST write SetTextST;
    {@member textElement
      A full text representation of the address.
    }
    property textElement : TFhirString read FText write SetText;

    {@member lineList
      This component contains the house number, apartment number, street name, street direction, 
P.O. Box number, delivery hints, and similar address information.
    }
    property lineList : TFhirStringList read GetLineList;
    property hasLineList : boolean read GetHasLineList;

    {@member city
      Typed access to The name of the city, town, village or other community or delivery center.
    }
    property city : String read GetCityST write SetCityST;
    {@member cityElement
      The name of the city, town, village or other community or delivery center.
    }
    property cityElement : TFhirString read FCity write SetCity;

    {@member state
      Typed access to Sub-unit of a country with limited sovereignty in a federally organized country. A code may be used if codes are in common use (i.e. US 2 letter state codes).
    }
    property state : String read GetStateST write SetStateST;
    {@member stateElement
      Sub-unit of a country with limited sovereignty in a federally organized country. A code may be used if codes are in common use (i.e. US 2 letter state codes).
    }
    property stateElement : TFhirString read FState write SetState;

    {@member postalCode
      Typed access to A postal code designating a region defined by the postal service.
    }
    property postalCode : String read GetPostalCodeST write SetPostalCodeST;
    {@member postalCodeElement
      A postal code designating a region defined by the postal service.
    }
    property postalCodeElement : TFhirString read FPostalCode write SetPostalCode;

    {@member country
      Typed access to Country - a nation as commonly understood or generally accepted.
    }
    property country : String read GetCountryST write SetCountryST;
    {@member countryElement
      Country - a nation as commonly understood or generally accepted.
    }
    property countryElement : TFhirString read FCountry write SetCountry;

    {@member period
      Typed access to Time period when address was/is in use. (defined for API consistency)
    }
    property period : TFhirPeriod read FPeriod write SetPeriod;
    {@member periodElement
      Time period when address was/is in use.
    }
    property periodElement : TFhirPeriod read FPeriod write SetPeriod;

  end;


  TFhirAddressListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirAddressList;
    function GetCurrent : TFhirAddress;
  public
    Constructor Create(list : TFhirAddressList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirAddress read GetCurrent;
  end;


  {@Class TFhirAddressList
    A list of FhirAddress
  }
  {!.Net HL7Connect.Fhir.AddressList}
  TFhirAddressList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirAddress;
    procedure SetItemN(index : Integer; value : TFhirAddress);
  public
    {!script hide}
    function Link : TFhirAddressList; Overload;
    function Clone : TFhirAddressList; Overload;
    function GetEnumerator : TFhirAddressListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirAddress to the end of the list.
    }
    function Append : TFhirAddress;

    
    {@member AddItem
      Add an already existing FhirAddress to the end of the list.
    }
    procedure AddItem(value : TFhirAddress); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirAddress) : Integer;
    

    {@member Insert
      Insert FhirAddress before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirAddress;
    

    {@member InsertItem
       Insert an existing FhirAddress before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirAddress);
    
    {@member Item
       Get the iIndexth FhirAddress. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirAddress. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirAddress);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirAddress;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirAddresses[index : Integer] : TFhirAddress read GetItemN write SetItemN; default;
  End;


  {@Class TFhirHumanName : TFhirType
    A human's name with the ability to identify parts and usage.
  }
  {!.Net HL7Connect.Fhir.HumanName}
  TFhirHumanName = class (TFhirType)
  private
    FUse : TFhirEnum;
    FText : TFhirString;
    FfamilyList : TFhirStringList;
    FgivenList : TFhirStringList;
    FprefixList : TFhirStringList;
    FsuffixList : TFhirStringList;
    FPeriod : TFhirPeriod;
    Procedure SetUse(value : TFhirEnum);
    Function GetUseST : TFhirNameUse;
    Procedure SetUseST(value : TFhirNameUse);
    Procedure SetText(value : TFhirString);
    Function GetTextST : String;
    Procedure SetTextST(value : String);
    function GetFamilyList : TFhirStringList;
    function GetHasFamilyList : Boolean;
    function GetGivenList : TFhirStringList;
    function GetHasGivenList : Boolean;
    function GetPrefixList : TFhirStringList;
    function GetHasPrefixList : Boolean;
    function GetSuffixList : TFhirStringList;
    function GetHasSuffixList : Boolean;
    Procedure SetPeriod(value : TFhirPeriod);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirHumanName; overload;
    function Clone : TFhirHumanName; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member use
      Identifies the purpose for this name.
    }
    property use : TFhirNameUse read GetUseST write SetUseST;
    property useElement : TFhirEnum read FUse write SetUse;

    {@member text
      Typed access to A full text representation of the name.
    }
    property text : String read GetTextST write SetTextST;
    {@member textElement
      A full text representation of the name.
    }
    property textElement : TFhirString read FText write SetText;

    {@member familyList
      The part of a name that links to the genealogy. In some cultures (e.g. Eritrea) the family name of a son is the first name of his father.
    }
    property familyList : TFhirStringList read GetFamilyList;
    property hasFamilyList : boolean read GetHasFamilyList;

    {@member givenList
      Given name.
    }
    property givenList : TFhirStringList read GetGivenList;
    property hasGivenList : boolean read GetHasGivenList;

    {@member prefixList
      Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that appears at the start of the name.
    }
    property prefixList : TFhirStringList read GetPrefixList;
    property hasPrefixList : boolean read GetHasPrefixList;

    {@member suffixList
      Part of the name that is acquired as a title due to academic, legal, employment or nobility status, etc. and that appears at the end of the name.
    }
    property suffixList : TFhirStringList read GetSuffixList;
    property hasSuffixList : boolean read GetHasSuffixList;

    {@member period
      Typed access to Indicates the period of time when this name was valid for the named person. (defined for API consistency)
    }
    property period : TFhirPeriod read FPeriod write SetPeriod;
    {@member periodElement
      Indicates the period of time when this name was valid for the named person.
    }
    property periodElement : TFhirPeriod read FPeriod write SetPeriod;

  end;


  TFhirHumanNameListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirHumanNameList;
    function GetCurrent : TFhirHumanName;
  public
    Constructor Create(list : TFhirHumanNameList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirHumanName read GetCurrent;
  end;


  {@Class TFhirHumanNameList
    A list of FhirHumanName
  }
  {!.Net HL7Connect.Fhir.HumanNameList}
  TFhirHumanNameList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirHumanName;
    procedure SetItemN(index : Integer; value : TFhirHumanName);
  public
    {!script hide}
    function Link : TFhirHumanNameList; Overload;
    function Clone : TFhirHumanNameList; Overload;
    function GetEnumerator : TFhirHumanNameListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirHumanName to the end of the list.
    }
    function Append : TFhirHumanName;

    
    {@member AddItem
      Add an already existing FhirHumanName to the end of the list.
    }
    procedure AddItem(value : TFhirHumanName); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirHumanName) : Integer;
    

    {@member Insert
      Insert FhirHumanName before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirHumanName;
    

    {@member InsertItem
       Insert an existing FhirHumanName before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirHumanName);
    
    {@member Item
       Get the iIndexth FhirHumanName. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirHumanName. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirHumanName);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirHumanName;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirHumanNames[index : Integer] : TFhirHumanName read GetItemN write SetItemN; default;
  End;


  {@Class TFhirContactPoint : TFhirType
    Details for All kinds of technology mediated contact points for a person or organization, including telephone, email, etc.
  }
  {!.Net HL7Connect.Fhir.ContactPoint}
  TFhirContactPoint = class (TFhirType)
  private
    FSystem : TFhirEnum;
    FValue : TFhirString;
    FUse : TFhirEnum;
    FPeriod : TFhirPeriod;
    Procedure SetSystem(value : TFhirEnum);
    Function GetSystemST : TFhirContactPointSystem;
    Procedure SetSystemST(value : TFhirContactPointSystem);
    Procedure SetValue(value : TFhirString);
    Function GetValueST : String;
    Procedure SetValueST(value : String);
    Procedure SetUse(value : TFhirEnum);
    Function GetUseST : TFhirContactPointUse;
    Procedure SetUseST(value : TFhirContactPointUse);
    Procedure SetPeriod(value : TFhirPeriod);
  protected
    Procedure GetChildrenByName(child_name : string; list : TFHIRObjectList); override;
    Procedure ListProperties(oList : TFHIRPropertyList; bInheritedProperties : Boolean); Override;
  public
    constructor Create; Override;
    destructor Destroy; override;
    {!script hide}
    procedure Assign(oSource : TAdvObject); override;
    function Link : TFhirContactPoint; overload;
    function Clone : TFhirContactPoint; overload;
    procedure setProperty(propName : string; propValue : TFHIRObject); override;
    function FhirType : string; override;
    {!script show}
  published
    {@member system
      Telecommunications form for contact point - what communications system is required to make use of the contact.
    }
    property system : TFhirContactPointSystem read GetSystemST write SetSystemST;
    property systemElement : TFhirEnum read FSystem write SetSystem;

    {@member value
      Typed access to The actual contact point details, in a form that is meaningful to the designated communication system (i.e. phone number or email address).
    }
    property value : String read GetValueST write SetValueST;
    {@member valueElement
      The actual contact point details, in a form that is meaningful to the designated communication system (i.e. phone number or email address).
    }
    property valueElement : TFhirString read FValue write SetValue;

    {@member use
      Identifies the purpose for the contact point.
    }
    property use : TFhirContactPointUse read GetUseST write SetUseST;
    property useElement : TFhirEnum read FUse write SetUse;

    {@member period
      Typed access to Time period when the contact point was/is in use. (defined for API consistency)
    }
    property period : TFhirPeriod read FPeriod write SetPeriod;
    {@member periodElement
      Time period when the contact point was/is in use.
    }
    property periodElement : TFhirPeriod read FPeriod write SetPeriod;

  end;


  TFhirContactPointListEnumerator = class (TAdvObject)
  private
    FIndex : integer;
    FList : TFhirContactPointList;
    function GetCurrent : TFhirContactPoint;
  public
    Constructor Create(list : TFhirContactPointList);
    Destructor Destroy; override;
    function MoveNext : boolean;
    property Current : TFhirContactPoint read GetCurrent;
  end;


  {@Class TFhirContactPointList
    A list of FhirContactPoint
  }
  {!.Net HL7Connect.Fhir.ContactPointList}
  TFhirContactPointList = class (TFHIRObjectList)
  private
    function GetItemN(index : Integer) : TFhirContactPoint;
    procedure SetItemN(index : Integer; value : TFhirContactPoint);
  public
    {!script hide}
    function Link : TFhirContactPointList; Overload;
    function Clone : TFhirContactPointList; Overload;
    function GetEnumerator : TFhirContactPointListEnumerator;
    {!script show}
    

    {@member Append
      Add a FhirContactPoint to the end of the list.
    }
    function Append : TFhirContactPoint;

    
    {@member AddItem
      Add an already existing FhirContactPoint to the end of the list.
    }
    procedure AddItem(value : TFhirContactPoint); overload;

    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    
    {@member IndexOf
      See if an item is already in the list. returns -1 if not in the list
    }
    function IndexOf(value : TFhirContactPoint) : Integer;
    

    {@member Insert
      Insert FhirContactPoint before the designated index (0 = first item)
    }
    function Insert(index : Integer) : TFhirContactPoint;
    

    {@member InsertItem
       Insert an existing FhirContactPoint before the designated index (0 = first item)
    }
    procedure InsertItem(index : Integer; value : TFhirContactPoint);
    
    {@member Item
       Get the iIndexth FhirContactPoint. (0 = first item)
    }
    
    {@member Item
       Get the iIndexth FhirContactPoint. (0 = first item)
    }
    procedure SetItemByIndex(index : Integer; value : TFhirContactPoint);
    
    {@member Count
      The number of items in the collection
    }
    function Item(index : Integer) : TFhirContactPoint;
    
    {@member Count
      The number of items in the collection
    }
    function Count : Integer; Overload;
    
    {@member remove
      Remove the indexth item. The first item is index 0.
    }
    procedure Remove(index : Integer);
    {@member ClearItems
      Remove All Items from the list
    }
    procedure ClearItems;
    
    Property FhirContactPoints[index : Integer] : TFhirContactPoint read GetItemN write SetItemN; default;
  End;


  TFhirAge = TFhirQuantity;

  TFhirCount = TFhirQuantity;

  TFhirMoney = TFhirQuantity;

  TFhirDistance = TFhirQuantity;

  TFhirDuration = TFhirQuantity;

Const
  CODES_TFhirNarrativeStatus : Array[TFhirNarrativeStatus] of String = ('', 'generated', 'extensions', 'additional', 'empty');
  CODES_TFhirQuantityComparator : Array[TFhirQuantityComparator] of String = ('', '<', '<=', '>=', '>');
  CODES_TFhirIdentifierUse : Array[TFhirIdentifierUse] of String = ('', 'usual', 'official', 'temp', 'secondary');
  CODES_TFhirPropertyRepresentation : Array[TFhirPropertyRepresentation] of String = ('', 'xmlAttr');
  CODES_TFhirResourceSlicingRules : Array[TFhirResourceSlicingRules] of String = ('', 'closed', 'open', 'openAtEnd');
  CODES_TFhirResourceAggregationMode : Array[TFhirResourceAggregationMode] of String = ('', 'contained', 'referenced', 'bundled');
  CODES_TFhirConstraintSeverity : Array[TFhirConstraintSeverity] of String = ('', 'error', 'warning');
  CODES_TFhirBindingConformance : Array[TFhirBindingConformance] of String = ('', 'required', 'preferred', 'example');
  CODES_TFhirEventTiming : Array[TFhirEventTiming] of String = ('', 'HS', 'WAKE', 'AC', 'ACM', 'ACD', 'ACV', 'PC', 'PCM', 'PCD', 'PCV');
  CODES_TFhirUnitsOfTime : Array[TFhirUnitsOfTime] of String = ('', 's', 'min', 'h', 'd', 'wk', 'mo', 'a');
  CODES_TFhirAddressUse : Array[TFhirAddressUse] of String = ('', 'home', 'work', 'temp', 'old');
  CODES_TFhirNameUse : Array[TFhirNameUse] of String = ('', 'usual', 'official', 'temp', 'nickname', 'anonymous', 'old', 'maiden');
  CODES_TFhirContactPointSystem : Array[TFhirContactPointSystem] of String = ('', 'phone', 'fax', 'email', 'url');
  CODES_TFhirContactPointUse : Array[TFhirContactPointUse] of String = ('', 'home', 'work', 'temp', 'old', 'mobile');
  CODES_TFhirAlertStatus : Array[TFhirAlertStatus] of String = ('', 'active', 'inactive', 'entered in error');
  CODES_TFhirAllergyIntoleranceStatus : Array[TFhirAllergyIntoleranceStatus] of String = ('', 'unconfirmed', 'confirmed', 'resolved', 'refuted');
  CODES_TFhirAllergyIntoleranceCriticality : Array[TFhirAllergyIntoleranceCriticality] of String = ('', 'low', 'high', 'unassessible');
  CODES_TFhirAllergyIntoleranceType : Array[TFhirAllergyIntoleranceType] of String = ('', 'immune', 'non-immune');
  CODES_TFhirAllergyIntoleranceCategory : Array[TFhirAllergyIntoleranceCategory] of String = ('', 'food', 'medication', 'environment');
  CODES_TFhirReactionEventCertainty : Array[TFhirReactionEventCertainty] of String = ('', 'unlikely', 'likely', 'confirmed');
  CODES_TFhirReactionEventSeverity : Array[TFhirReactionEventSeverity] of String = ('', 'mild', 'moderate', 'severe');
  CODES_TFhirAppointmentstatus : Array[TFhirAppointmentstatus] of String = ('', 'pending', 'booked', 'arrived', 'fulfilled', 'cancelled', 'noshow');
  CODES_TFhirParticipantrequired : Array[TFhirParticipantrequired] of String = ('', 'required', 'optional', 'information-only');
  CODES_TFhirParticipationstatus : Array[TFhirParticipationstatus] of String = ('', 'accepted', 'declined', 'tentative', 'in-process', 'completed', 'needs-action');
  CODES_TFhirParticipantstatus : Array[TFhirParticipantstatus] of String = ('', 'accepted', 'declined', 'tentative', 'in-process', 'completed', 'needs-action');
  CODES_TFhirBundleType : Array[TFhirBundleType] of String = ('', 'document', 'message', 'transaction', 'transaction-response', 'history', 'searchset', 'collection');
  CODES_TFhirBundleEntryStatus : Array[TFhirBundleEntryStatus] of String = ('', 'create', 'update', 'match', 'include');
  CODES_TFhirCarePlanStatus : Array[TFhirCarePlanStatus] of String = ('', 'planned', 'active', 'completed');
  CODES_TFhirCarePlanGoalStatus : Array[TFhirCarePlanGoalStatus] of String = ('', 'in progress', 'achieved', 'sustaining', 'cancelled');
  CODES_TFhirCarePlanActivityStatus : Array[TFhirCarePlanActivityStatus] of String = ('', 'not started', 'scheduled', 'in progress', 'on hold', 'completed', 'cancelled');
  CODES_TFhirCarePlanActivityCategory : Array[TFhirCarePlanActivityCategory] of String = ('', 'diet', 'drug', 'encounter', 'observation', 'procedure', 'supply', 'other');
  CODES_TFhirCarePlan2Status : Array[TFhirCarePlan2Status] of String = ('', 'planned', 'active', 'completed');
  CODES_TFhirRSLink : Array[TFhirRSLink] of String = ('', 'complete', 'error');
  CODES_TFhirCommunicationStatus : Array[TFhirCommunicationStatus] of String = ('', 'in progress', 'completed', 'suspended', 'rejected', 'failed');
  CODES_TFhirCommunicationRequestStatus : Array[TFhirCommunicationRequestStatus] of String = ('', 'proposed', 'planned', 'requested', 'received', 'accepted', 'in progress', 'completed', 'suspended', 'rejected', 'failed');
  CODES_TFhirCompositionStatus : Array[TFhirCompositionStatus] of String = ('', 'preliminary', 'final', 'appended', 'amended', 'entered in error');
  CODES_TFhirCompositionAttestationMode : Array[TFhirCompositionAttestationMode] of String = ('', 'personal', 'professional', 'legal', 'official');
  CODES_TFhirValuesetStatus : Array[TFhirValuesetStatus] of String = ('', 'draft', 'active', 'retired');
  CODES_TFhirConceptEquivalence : Array[TFhirConceptEquivalence] of String = ('', 'equivalent', 'equal', 'wider', 'subsumes', 'narrower', 'specialises', 'inexact', 'unmatched', 'disjoint');
  CODES_TFhirConditionStatus : Array[TFhirConditionStatus] of String = ('', 'provisional', 'working', 'confirmed', 'refuted');
  CODES_TFhirConformanceStatementStatus : Array[TFhirConformanceStatementStatus] of String = ('', 'draft', 'active', 'retired');
  CODES_TFhirRestfulConformanceMode : Array[TFhirRestfulConformanceMode] of String = ('', 'client', 'server');
  CODES_TFhirTypeRestfulInteraction : Array[TFhirTypeRestfulInteraction] of String = ('', 'read', 'vread', 'update', 'delete', 'history-instance', 'validate', 'history-type', 'create', 'search-type');
  CODES_TFhirVersioningPolicy : Array[TFhirVersioningPolicy] of String = ('', 'no-version', 'versioned', 'versioned-update');
  CODES_TFhirSearchParamType : Array[TFhirSearchParamType] of String = ('', 'number', 'date', 'string', 'token', 'reference', 'composite', 'quantity');
  CODES_TFhirSystemRestfulInteraction : Array[TFhirSystemRestfulInteraction] of String = ('', 'transaction', 'search-system', 'history-system');
  CODES_TFhirMessageSignificanceCategory : Array[TFhirMessageSignificanceCategory] of String = ('', 'Consequence', 'Currency', 'Notification');
  CODES_TFhirMessageConformanceEventMode : Array[TFhirMessageConformanceEventMode] of String = ('', 'sender', 'receiver');
  CODES_TFhirDocumentMode : Array[TFhirDocumentMode] of String = ('', 'producer', 'consumer');
  CODES_TFhirResourceObservationDefStatus : Array[TFhirResourceObservationDefStatus] of String = ('', 'draft', 'active', 'retired');
  CODES_TFhirDataelementGranularity : Array[TFhirDataelementGranularity] of String = ('', 'comparable', 'fully specified', 'equivalent', 'convertable', 'scaleable', 'flexible');
  CODES_TFhirMeasurementPrinciple : Array[TFhirMeasurementPrinciple] of String = ('', 'other', 'chemical', 'electrical', 'impedance', 'nuclear', 'optical', 'thermal', 'biological', 'mechanical', 'acoustical', 'manual');
  CODES_TFhirMetricOperationalStatus : Array[TFhirMetricOperationalStatus] of String = ('', 'on', 'off', 'standby');
  CODES_TFhirMetricCategory : Array[TFhirMetricCategory] of String = ('', 'measurement', 'setting', 'calculation', 'unspecified');
  CODES_TFhirMetricCalibrationType : Array[TFhirMetricCalibrationType] of String = ('', 'unspecified', 'offset', 'gain', 'two-point');
  CODES_TFhirMetricCalibrationState : Array[TFhirMetricCalibrationState] of String = ('', 'not-calibrated', 'calibration-required', 'calibrated', 'unspecified');
  CODES_TFhirDeviceUseRequestStatus : Array[TFhirDeviceUseRequestStatus] of String = ('', 'proposed', 'planned', 'requested', 'received', 'accepted', 'in progress', 'completed', 'suspended', 'rejected', 'aborted');
  CODES_TFhirDeviceUseRequestPriority : Array[TFhirDeviceUseRequestPriority] of String = ('', 'routine', 'urgent', 'stat', 'asap');
  CODES_TFhirDiagnosticOrderStatus : Array[TFhirDiagnosticOrderStatus] of String = ('', 'requested', 'received', 'accepted', 'in progress', 'review', 'completed', 'suspended', 'rejected', 'failed');
  CODES_TFhirDiagnosticOrderPriority : Array[TFhirDiagnosticOrderPriority] of String = ('', 'routine', 'urgent', 'stat', 'asap');
  CODES_TFhirDiagnosticReportStatus : Array[TFhirDiagnosticReportStatus] of String = ('', 'registered', 'partial', 'final', 'corrected', 'amended', 'appended', 'cancelled', 'entered in error');
  CODES_TFhirDocumentReferenceStatus : Array[TFhirDocumentReferenceStatus] of String = ('', 'current', 'superceded', 'entered in error');
  CODES_TFhirDocumentRelationshipType : Array[TFhirDocumentRelationshipType] of String = ('', 'replaces', 'transforms', 'signs', 'appends');
  CODES_TFhirEncounterState : Array[TFhirEncounterState] of String = ('', 'planned', 'arrived', 'in progress', 'onleave', 'finished', 'cancelled');
  CODES_TFhirEncounterClass : Array[TFhirEncounterClass] of String = ('', 'inpatient', 'outpatient', 'ambulatory', 'emergency', 'home', 'field', 'daytime', 'virtual', 'other');
  CODES_TFhirEncounterLocationStatus : Array[TFhirEncounterLocationStatus] of String = ('', 'planned', 'present', 'reserved');
  CODES_TFhirEpisodeOfCareStatus : Array[TFhirEpisodeOfCareStatus] of String = ('', 'planned', 'active', 'onhold', 'finished', 'withdrawn', 'other');
  CODES_TFhirResourceProfileStatus : Array[TFhirResourceProfileStatus] of String = ('', 'draft', 'active', 'retired');
  CODES_TFhirExtensionContext : Array[TFhirExtensionContext] of String = ('', 'resource', 'datatype', 'mapping', 'extension');
  CODES_TFhirGoalStatus : Array[TFhirGoalStatus] of String = ('', 'proposed', 'planned', 'in progress', 'achieved', 'sustaining', 'cancelled', 'accepted', 'rejected');
  CODES_TFhirGroupType : Array[TFhirGroupType] of String = ('', 'person', 'animal', 'practitioner', 'device', 'medication', 'substance');
  CODES_TFhirImagingModality : Array[TFhirImagingModality] of String = ('', 'AR', 'BMD', 'BDUS', 'EPS', 'CR', 'CT', 'DX', 'ECG', 'ES', 'XC', 'GM', 'HD', 'IO', 'IVOCT', 'IVUS', 'KER', 'LEN', 'MR', 'MG', 'NM', 'OAM', 'OCT', 'OPM', 'OP', 'OPR', 'OPT', 'OPV', 'PX', 'PT', 'RF', 'RG', 'SM', 'SRF', 'US', 'VA', 'XA');
  CODES_TFhirInstanceAvailability : Array[TFhirInstanceAvailability] of String = ('', 'ONLINE', 'OFFLINE', 'NEARLINE', 'UNAVAILABLE');
  CODES_TFhirModality : Array[TFhirModality] of String = ('', 'AR', 'AU', 'BDUS', 'BI', 'BMD', 'CR', 'CT', 'DG', 'DX', 'ECG', 'EPS', 'ES', 'GM', 'HC', 'HD', 'IO', 'IVOCT', 'IVUS', 'KER', 'KO', 'LEN', 'LS', 'MG', 'MR', 'NM', 'OAM', 'OCT', 'OP', 'OPM', 'OPT', 'OPV', 'OT', 'PR', 'PT', 'PX', 'REG', 'RF', 'RG', 'RTDOSE', 'RTIMAGE', 'RTPLAN', 'RTRECORD', 'RTSTRUCT', 'SEG', 'SM', 'SMR', 'SR', 'SRF', 'TG', 'US', 'VA', 'XA', 'XC');
  CODES_TFhirUseLink : Array[TFhirUseLink] of String = ('', 'complete', 'proposed', 'exploratory', 'other');
  CODES_TFhirListMode : Array[TFhirListMode] of String = ('', 'working', 'snapshot', 'changes');
  CODES_TFhirLocationStatus : Array[TFhirLocationStatus] of String = ('', 'active', 'suspended', 'inactive');
  CODES_TFhirLocationMode : Array[TFhirLocationMode] of String = ('', 'instance', 'kind');
  CODES_TFhirMediaType : Array[TFhirMediaType] of String = ('', 'photo', 'video', 'audio');
  CODES_TFhirMedicationKind : Array[TFhirMedicationKind] of String = ('', 'product', 'package');
  CODES_TFhirMedicationAdminStatus : Array[TFhirMedicationAdminStatus] of String = ('', 'in progress', 'on hold', 'completed', 'entered in error', 'stopped');
  CODES_TFhirMedicationDispenseStatus : Array[TFhirMedicationDispenseStatus] of String = ('', 'in progress', 'on hold', 'completed', 'entered in error', 'stopped');
  CODES_TFhirMedicationPrescriptionStatus : Array[TFhirMedicationPrescriptionStatus] of String = ('', 'active', 'on hold', 'completed', 'entered in error', 'stopped', 'superceded');
  CODES_TFhirResponseCode : Array[TFhirResponseCode] of String = ('', 'ok', 'transient-error', 'fatal-error');
  CODES_TFhirNamingsystemType : Array[TFhirNamingsystemType] of String = ('', 'codesystem', 'identifier', 'root');
  CODES_TFhirNamingsystemStatus : Array[TFhirNamingsystemStatus] of String = ('', 'proposed', 'active', 'retired');
  CODES_TFhirNamingsystemIdentifierType : Array[TFhirNamingsystemIdentifierType] of String = ('', 'oid', 'uuid', 'uri', 'other');
  CODES_TFhirNutritionOrderStatus : Array[TFhirNutritionOrderStatus] of String = ('', 'requested', 'active', 'inactive', 'held', 'cancelled');
  CODES_TFhirDataAbsentReason : Array[TFhirDataAbsentReason] of String = ('', 'unknown', 'asked', 'temp', 'notasked', 'masked', 'unsupported', 'astext', 'error');
  CODES_TFhirObservationStatus : Array[TFhirObservationStatus] of String = ('', 'registered', 'preliminary', 'final', 'amended', 'cancelled', 'entered in error');
  CODES_TFhirObservationReliability : Array[TFhirObservationReliability] of String = ('', 'ok', 'ongoing', 'early', 'questionable', 'calibrating', 'error', 'unknown');
  CODES_TFhirObservationRelationshiptypes : Array[TFhirObservationRelationshiptypes] of String = ('', 'has-component', 'has-member', 'derived-from', 'sequel-to', 'replaces', 'qualified-by', 'interfered-by');
  CODES_TFhirOperationKind : Array[TFhirOperationKind] of String = ('', 'operation', 'query');
  CODES_TFhirOperationParameterUse : Array[TFhirOperationParameterUse] of String = ('', 'in', 'out');
  CODES_TFhirIssueSeverity : Array[TFhirIssueSeverity] of String = ('', 'fatal', 'error', 'warning', 'information');
  CODES_TFhirOrderOutcomeCode : Array[TFhirOrderOutcomeCode] of String = ('', 'pending', 'review', 'rejected', 'error', 'accepted', 'cancelled', 'replaced', 'aborted', 'complete');
  CODES_TFhirAdministrativeGender : Array[TFhirAdministrativeGender] of String = ('', 'male', 'female', 'other', 'unknown');
  CODES_TFhirLinkType : Array[TFhirLinkType] of String = ('', 'replace', 'refer', 'seealso');
  CODES_TFhirIdentityAssuranceLevel : Array[TFhirIdentityAssuranceLevel] of String = ('', 'level1', 'level2', 'level3', 'level4');
  CODES_TFhirProcedureRelationshipType : Array[TFhirProcedureRelationshipType] of String = ('', 'caused-by', 'because-of');
  CODES_TFhirProcedureRequestStatus : Array[TFhirProcedureRequestStatus] of String = ('', 'proposed', 'planned', 'requested', 'received', 'accepted', 'in progress', 'completed', 'suspended', 'rejected', 'aborted');
  CODES_TFhirProcedureRequestPriority : Array[TFhirProcedureRequestPriority] of String = ('', 'routine', 'urgent', 'stat', 'asap');
  CODES_TFhirProvenanceEntityRole : Array[TFhirProvenanceEntityRole] of String = ('', 'derivation', 'revision', 'quotation', 'source');
  CODES_TFhirQuestionnaireStatus : Array[TFhirQuestionnaireStatus] of String = ('', 'draft', 'published', 'retired');
  CODES_TFhirAnswerFormat : Array[TFhirAnswerFormat] of String = ('', 'boolean', 'decimal', 'integer', 'date', 'dateTime', 'instant', 'time', 'string', 'text', 'choice', 'open-choice', 'attachment', 'reference', 'quantity');
  CODES_TFhirQuestionnaireAnswersStatus : Array[TFhirQuestionnaireAnswersStatus] of String = ('', 'in progress', 'completed', 'amended');
  CODES_TFhirReferralstatus : Array[TFhirReferralstatus] of String = ('', 'draft', 'sent', 'active', 'cancelled', 'refused', 'completed');
  CODES_TFhirSecurityEventAction : Array[TFhirSecurityEventAction] of String = ('', 'C', 'R', 'U', 'D', 'E');
  CODES_TFhirSecurityEventOutcome : Array[TFhirSecurityEventOutcome] of String = ('', '0', '4', '8', '12');
  CODES_TFhirNetworkType : Array[TFhirNetworkType] of String = ('', '1', '2', '3', '4', '5');
  CODES_TFhirObjectType : Array[TFhirObjectType] of String = ('', '1', '2', '3', '4');
  CODES_TFhirObjectRole : Array[TFhirObjectRole] of String = ('', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24');
  CODES_TFhirObjectLifecycle : Array[TFhirObjectLifecycle] of String = ('', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15');
  CODES_TFhirSlotstatus : Array[TFhirSlotstatus] of String = ('', 'BUSY', 'FREE', 'BUSY-UNAVAILABLE', 'BUSY-TENTATIVE');
  CODES_TFhirHierarchicalRelationshipType : Array[TFhirHierarchicalRelationshipType] of String = ('', 'parent', 'child');
  CODES_TFhirSubscriptionStatus : Array[TFhirSubscriptionStatus] of String = ('', 'requested', 'active', 'error', 'off');
  CODES_TFhirSubscriptionChannelType : Array[TFhirSubscriptionChannelType] of String = ('', 'rest-hook', 'websocket', 'email', 'sms', 'message');
  CODES_TFhirValuesetSupplyStatus : Array[TFhirValuesetSupplyStatus] of String = ('', 'requested', 'dispensed', 'received', 'failed', 'cancelled');
  CODES_TFhirValuesetSupplyDispenseStatus : Array[TFhirValuesetSupplyDispenseStatus] of String = ('', 'in progress', 'dispensed', 'abandoned');
  CODES_TFhirFilterOperator : Array[TFhirFilterOperator] of String = ('', '=', 'is-a', 'is-not-a', 'regex', 'in', 'not in');
  CODES_TFhirEyeCodes : Array[TFhirEyeCodes] of String = ('', 'right', 'left');
  CODES_TFhirBaseCodes : Array[TFhirBaseCodes] of String = ('', 'up', 'down', 'in', 'out');

Function TFhirNarrativeStatusListAsInteger(aSet : TFhirNarrativeStatusList) : Integer; overload;
Function IntegerAsTFhirNarrativeStatusList(i : integer) : TFhirNarrativeStatusList; overload;
Function TFhirQuantityComparatorListAsInteger(aSet : TFhirQuantityComparatorList) : Integer; overload;
Function IntegerAsTFhirQuantityComparatorList(i : integer) : TFhirQuantityComparatorList; overload;
Function TFhirIdentifierUseListAsInteger(aSet : TFhirIdentifierUseList) : Integer; overload;
Function IntegerAsTFhirIdentifierUseList(i : integer) : TFhirIdentifierUseList; overload;
Function TFhirPropertyRepresentationListAsInteger(aSet : TFhirPropertyRepresentationList) : Integer; overload;
Function IntegerAsTFhirPropertyRepresentationList(i : integer) : TFhirPropertyRepresentationList; overload;
Function TFhirResourceSlicingRulesListAsInteger(aSet : TFhirResourceSlicingRulesList) : Integer; overload;
Function IntegerAsTFhirResourceSlicingRulesList(i : integer) : TFhirResourceSlicingRulesList; overload;
Function TFhirResourceAggregationModeListAsInteger(aSet : TFhirResourceAggregationModeList) : Integer; overload;
Function IntegerAsTFhirResourceAggregationModeList(i : integer) : TFhirResourceAggregationModeList; overload;
Function TFhirConstraintSeverityListAsInteger(aSet : TFhirConstraintSeverityList) : Integer; overload;
Function IntegerAsTFhirConstraintSeverityList(i : integer) : TFhirConstraintSeverityList; overload;
Function TFhirBindingConformanceListAsInteger(aSet : TFhirBindingConformanceList) : Integer; overload;
Function IntegerAsTFhirBindingConformanceList(i : integer) : TFhirBindingConformanceList; overload;
Function TFhirEventTimingListAsInteger(aSet : TFhirEventTimingList) : Integer; overload;
Function IntegerAsTFhirEventTimingList(i : integer) : TFhirEventTimingList; overload;
Function TFhirUnitsOfTimeListAsInteger(aSet : TFhirUnitsOfTimeList) : Integer; overload;
Function IntegerAsTFhirUnitsOfTimeList(i : integer) : TFhirUnitsOfTimeList; overload;
Function TFhirAddressUseListAsInteger(aSet : TFhirAddressUseList) : Integer; overload;
Function IntegerAsTFhirAddressUseList(i : integer) : TFhirAddressUseList; overload;
Function TFhirNameUseListAsInteger(aSet : TFhirNameUseList) : Integer; overload;
Function IntegerAsTFhirNameUseList(i : integer) : TFhirNameUseList; overload;
Function TFhirContactPointSystemListAsInteger(aSet : TFhirContactPointSystemList) : Integer; overload;
Function IntegerAsTFhirContactPointSystemList(i : integer) : TFhirContactPointSystemList; overload;
Function TFhirContactPointUseListAsInteger(aSet : TFhirContactPointUseList) : Integer; overload;
Function IntegerAsTFhirContactPointUseList(i : integer) : TFhirContactPointUseList; overload;
Function TFhirAlertStatusListAsInteger(aSet : TFhirAlertStatusList) : Integer; overload;
Function IntegerAsTFhirAlertStatusList(i : integer) : TFhirAlertStatusList; overload;
Function TFhirAllergyIntoleranceStatusListAsInteger(aSet : TFhirAllergyIntoleranceStatusList) : Integer; overload;
Function IntegerAsTFhirAllergyIntoleranceStatusList(i : integer) : TFhirAllergyIntoleranceStatusList; overload;
Function TFhirAllergyIntoleranceCriticalityListAsInteger(aSet : TFhirAllergyIntoleranceCriticalityList) : Integer; overload;
Function IntegerAsTFhirAllergyIntoleranceCriticalityList(i : integer) : TFhirAllergyIntoleranceCriticalityList; overload;
Function TFhirAllergyIntoleranceTypeListAsInteger(aSet : TFhirAllergyIntoleranceTypeList) : Integer; overload;
Function IntegerAsTFhirAllergyIntoleranceTypeList(i : integer) : TFhirAllergyIntoleranceTypeList; overload;
Function TFhirAllergyIntoleranceCategoryListAsInteger(aSet : TFhirAllergyIntoleranceCategoryList) : Integer; overload;
Function IntegerAsTFhirAllergyIntoleranceCategoryList(i : integer) : TFhirAllergyIntoleranceCategoryList; overload;
Function TFhirReactionEventCertaintyListAsInteger(aSet : TFhirReactionEventCertaintyList) : Integer; overload;
Function IntegerAsTFhirReactionEventCertaintyList(i : integer) : TFhirReactionEventCertaintyList; overload;
Function TFhirReactionEventSeverityListAsInteger(aSet : TFhirReactionEventSeverityList) : Integer; overload;
Function IntegerAsTFhirReactionEventSeverityList(i : integer) : TFhirReactionEventSeverityList; overload;
Function TFhirAppointmentstatusListAsInteger(aSet : TFhirAppointmentstatusList) : Integer; overload;
Function IntegerAsTFhirAppointmentstatusList(i : integer) : TFhirAppointmentstatusList; overload;
Function TFhirParticipantrequiredListAsInteger(aSet : TFhirParticipantrequiredList) : Integer; overload;
Function IntegerAsTFhirParticipantrequiredList(i : integer) : TFhirParticipantrequiredList; overload;
Function TFhirParticipationstatusListAsInteger(aSet : TFhirParticipationstatusList) : Integer; overload;
Function IntegerAsTFhirParticipationstatusList(i : integer) : TFhirParticipationstatusList; overload;
Function TFhirParticipantstatusListAsInteger(aSet : TFhirParticipantstatusList) : Integer; overload;
Function IntegerAsTFhirParticipantstatusList(i : integer) : TFhirParticipantstatusList; overload;
Function TFhirBundleTypeListAsInteger(aSet : TFhirBundleTypeList) : Integer; overload;
Function IntegerAsTFhirBundleTypeList(i : integer) : TFhirBundleTypeList; overload;
Function TFhirBundleEntryStatusListAsInteger(aSet : TFhirBundleEntryStatusList) : Integer; overload;
Function IntegerAsTFhirBundleEntryStatusList(i : integer) : TFhirBundleEntryStatusList; overload;
Function TFhirCarePlanStatusListAsInteger(aSet : TFhirCarePlanStatusList) : Integer; overload;
Function IntegerAsTFhirCarePlanStatusList(i : integer) : TFhirCarePlanStatusList; overload;
Function TFhirCarePlanGoalStatusListAsInteger(aSet : TFhirCarePlanGoalStatusList) : Integer; overload;
Function IntegerAsTFhirCarePlanGoalStatusList(i : integer) : TFhirCarePlanGoalStatusList; overload;
Function TFhirCarePlanActivityStatusListAsInteger(aSet : TFhirCarePlanActivityStatusList) : Integer; overload;
Function IntegerAsTFhirCarePlanActivityStatusList(i : integer) : TFhirCarePlanActivityStatusList; overload;
Function TFhirCarePlanActivityCategoryListAsInteger(aSet : TFhirCarePlanActivityCategoryList) : Integer; overload;
Function IntegerAsTFhirCarePlanActivityCategoryList(i : integer) : TFhirCarePlanActivityCategoryList; overload;
Function TFhirCarePlan2StatusListAsInteger(aSet : TFhirCarePlan2StatusList) : Integer; overload;
Function IntegerAsTFhirCarePlan2StatusList(i : integer) : TFhirCarePlan2StatusList; overload;
Function TFhirRSLinkListAsInteger(aSet : TFhirRSLinkList) : Integer; overload;
Function IntegerAsTFhirRSLinkList(i : integer) : TFhirRSLinkList; overload;
Function TFhirCommunicationStatusListAsInteger(aSet : TFhirCommunicationStatusList) : Integer; overload;
Function IntegerAsTFhirCommunicationStatusList(i : integer) : TFhirCommunicationStatusList; overload;
Function TFhirCommunicationRequestStatusListAsInteger(aSet : TFhirCommunicationRequestStatusList) : Integer; overload;
Function IntegerAsTFhirCommunicationRequestStatusList(i : integer) : TFhirCommunicationRequestStatusList; overload;
Function TFhirCompositionStatusListAsInteger(aSet : TFhirCompositionStatusList) : Integer; overload;
Function IntegerAsTFhirCompositionStatusList(i : integer) : TFhirCompositionStatusList; overload;
Function TFhirCompositionAttestationModeListAsInteger(aSet : TFhirCompositionAttestationModeList) : Integer; overload;
Function IntegerAsTFhirCompositionAttestationModeList(i : integer) : TFhirCompositionAttestationModeList; overload;
Function TFhirValuesetStatusListAsInteger(aSet : TFhirValuesetStatusList) : Integer; overload;
Function IntegerAsTFhirValuesetStatusList(i : integer) : TFhirValuesetStatusList; overload;
Function TFhirConceptEquivalenceListAsInteger(aSet : TFhirConceptEquivalenceList) : Integer; overload;
Function IntegerAsTFhirConceptEquivalenceList(i : integer) : TFhirConceptEquivalenceList; overload;
Function TFhirConditionStatusListAsInteger(aSet : TFhirConditionStatusList) : Integer; overload;
Function IntegerAsTFhirConditionStatusList(i : integer) : TFhirConditionStatusList; overload;
Function TFhirConformanceStatementStatusListAsInteger(aSet : TFhirConformanceStatementStatusList) : Integer; overload;
Function IntegerAsTFhirConformanceStatementStatusList(i : integer) : TFhirConformanceStatementStatusList; overload;
Function TFhirRestfulConformanceModeListAsInteger(aSet : TFhirRestfulConformanceModeList) : Integer; overload;
Function IntegerAsTFhirRestfulConformanceModeList(i : integer) : TFhirRestfulConformanceModeList; overload;
Function TFhirTypeRestfulInteractionListAsInteger(aSet : TFhirTypeRestfulInteractionList) : Integer; overload;
Function IntegerAsTFhirTypeRestfulInteractionList(i : integer) : TFhirTypeRestfulInteractionList; overload;
Function TFhirVersioningPolicyListAsInteger(aSet : TFhirVersioningPolicyList) : Integer; overload;
Function IntegerAsTFhirVersioningPolicyList(i : integer) : TFhirVersioningPolicyList; overload;
Function TFhirSearchParamTypeListAsInteger(aSet : TFhirSearchParamTypeList) : Integer; overload;
Function IntegerAsTFhirSearchParamTypeList(i : integer) : TFhirSearchParamTypeList; overload;
Function TFhirSystemRestfulInteractionListAsInteger(aSet : TFhirSystemRestfulInteractionList) : Integer; overload;
Function IntegerAsTFhirSystemRestfulInteractionList(i : integer) : TFhirSystemRestfulInteractionList; overload;
Function TFhirMessageSignificanceCategoryListAsInteger(aSet : TFhirMessageSignificanceCategoryList) : Integer; overload;
Function IntegerAsTFhirMessageSignificanceCategoryList(i : integer) : TFhirMessageSignificanceCategoryList; overload;
Function TFhirMessageConformanceEventModeListAsInteger(aSet : TFhirMessageConformanceEventModeList) : Integer; overload;
Function IntegerAsTFhirMessageConformanceEventModeList(i : integer) : TFhirMessageConformanceEventModeList; overload;
Function TFhirDocumentModeListAsInteger(aSet : TFhirDocumentModeList) : Integer; overload;
Function IntegerAsTFhirDocumentModeList(i : integer) : TFhirDocumentModeList; overload;
Function TFhirResourceObservationDefStatusListAsInteger(aSet : TFhirResourceObservationDefStatusList) : Integer; overload;
Function IntegerAsTFhirResourceObservationDefStatusList(i : integer) : TFhirResourceObservationDefStatusList; overload;
Function TFhirDataelementGranularityListAsInteger(aSet : TFhirDataelementGranularityList) : Integer; overload;
Function IntegerAsTFhirDataelementGranularityList(i : integer) : TFhirDataelementGranularityList; overload;
Function TFhirMeasurementPrincipleListAsInteger(aSet : TFhirMeasurementPrincipleList) : Integer; overload;
Function IntegerAsTFhirMeasurementPrincipleList(i : integer) : TFhirMeasurementPrincipleList; overload;
Function TFhirMetricOperationalStatusListAsInteger(aSet : TFhirMetricOperationalStatusList) : Integer; overload;
Function IntegerAsTFhirMetricOperationalStatusList(i : integer) : TFhirMetricOperationalStatusList; overload;
Function TFhirMetricCategoryListAsInteger(aSet : TFhirMetricCategoryList) : Integer; overload;
Function IntegerAsTFhirMetricCategoryList(i : integer) : TFhirMetricCategoryList; overload;
Function TFhirMetricCalibrationTypeListAsInteger(aSet : TFhirMetricCalibrationTypeList) : Integer; overload;
Function IntegerAsTFhirMetricCalibrationTypeList(i : integer) : TFhirMetricCalibrationTypeList; overload;
Function TFhirMetricCalibrationStateListAsInteger(aSet : TFhirMetricCalibrationStateList) : Integer; overload;
Function IntegerAsTFhirMetricCalibrationStateList(i : integer) : TFhirMetricCalibrationStateList; overload;
Function TFhirDeviceUseRequestStatusListAsInteger(aSet : TFhirDeviceUseRequestStatusList) : Integer; overload;
Function IntegerAsTFhirDeviceUseRequestStatusList(i : integer) : TFhirDeviceUseRequestStatusList; overload;
Function TFhirDeviceUseRequestPriorityListAsInteger(aSet : TFhirDeviceUseRequestPriorityList) : Integer; overload;
Function IntegerAsTFhirDeviceUseRequestPriorityList(i : integer) : TFhirDeviceUseRequestPriorityList; overload;
Function TFhirDiagnosticOrderStatusListAsInteger(aSet : TFhirDiagnosticOrderStatusList) : Integer; overload;
Function IntegerAsTFhirDiagnosticOrderStatusList(i : integer) : TFhirDiagnosticOrderStatusList; overload;
Function TFhirDiagnosticOrderPriorityListAsInteger(aSet : TFhirDiagnosticOrderPriorityList) : Integer; overload;
Function IntegerAsTFhirDiagnosticOrderPriorityList(i : integer) : TFhirDiagnosticOrderPriorityList; overload;
Function TFhirDiagnosticReportStatusListAsInteger(aSet : TFhirDiagnosticReportStatusList) : Integer; overload;
Function IntegerAsTFhirDiagnosticReportStatusList(i : integer) : TFhirDiagnosticReportStatusList; overload;
Function TFhirDocumentReferenceStatusListAsInteger(aSet : TFhirDocumentReferenceStatusList) : Integer; overload;
Function IntegerAsTFhirDocumentReferenceStatusList(i : integer) : TFhirDocumentReferenceStatusList; overload;
Function TFhirDocumentRelationshipTypeListAsInteger(aSet : TFhirDocumentRelationshipTypeList) : Integer; overload;
Function IntegerAsTFhirDocumentRelationshipTypeList(i : integer) : TFhirDocumentRelationshipTypeList; overload;
Function TFhirEncounterStateListAsInteger(aSet : TFhirEncounterStateList) : Integer; overload;
Function IntegerAsTFhirEncounterStateList(i : integer) : TFhirEncounterStateList; overload;
Function TFhirEncounterClassListAsInteger(aSet : TFhirEncounterClassList) : Integer; overload;
Function IntegerAsTFhirEncounterClassList(i : integer) : TFhirEncounterClassList; overload;
Function TFhirEncounterLocationStatusListAsInteger(aSet : TFhirEncounterLocationStatusList) : Integer; overload;
Function IntegerAsTFhirEncounterLocationStatusList(i : integer) : TFhirEncounterLocationStatusList; overload;
Function TFhirEpisodeOfCareStatusListAsInteger(aSet : TFhirEpisodeOfCareStatusList) : Integer; overload;
Function IntegerAsTFhirEpisodeOfCareStatusList(i : integer) : TFhirEpisodeOfCareStatusList; overload;
Function TFhirResourceProfileStatusListAsInteger(aSet : TFhirResourceProfileStatusList) : Integer; overload;
Function IntegerAsTFhirResourceProfileStatusList(i : integer) : TFhirResourceProfileStatusList; overload;
Function TFhirExtensionContextListAsInteger(aSet : TFhirExtensionContextList) : Integer; overload;
Function IntegerAsTFhirExtensionContextList(i : integer) : TFhirExtensionContextList; overload;
Function TFhirGoalStatusListAsInteger(aSet : TFhirGoalStatusList) : Integer; overload;
Function IntegerAsTFhirGoalStatusList(i : integer) : TFhirGoalStatusList; overload;
Function TFhirGroupTypeListAsInteger(aSet : TFhirGroupTypeList) : Integer; overload;
Function IntegerAsTFhirGroupTypeList(i : integer) : TFhirGroupTypeList; overload;
Function TFhirImagingModalityListAsInteger(aSet : TFhirImagingModalityList) : Integer; overload;
Function IntegerAsTFhirImagingModalityList(i : integer) : TFhirImagingModalityList; overload;
Function TFhirInstanceAvailabilityListAsInteger(aSet : TFhirInstanceAvailabilityList) : Integer; overload;
Function IntegerAsTFhirInstanceAvailabilityList(i : integer) : TFhirInstanceAvailabilityList; overload;
Function TFhirModalityListAsInteger(aSet : TFhirModalityList) : Integer; overload;
Function IntegerAsTFhirModalityList(i : integer) : TFhirModalityList; overload;
Function TFhirUseLinkListAsInteger(aSet : TFhirUseLinkList) : Integer; overload;
Function IntegerAsTFhirUseLinkList(i : integer) : TFhirUseLinkList; overload;
Function TFhirListModeListAsInteger(aSet : TFhirListModeList) : Integer; overload;
Function IntegerAsTFhirListModeList(i : integer) : TFhirListModeList; overload;
Function TFhirLocationStatusListAsInteger(aSet : TFhirLocationStatusList) : Integer; overload;
Function IntegerAsTFhirLocationStatusList(i : integer) : TFhirLocationStatusList; overload;
Function TFhirLocationModeListAsInteger(aSet : TFhirLocationModeList) : Integer; overload;
Function IntegerAsTFhirLocationModeList(i : integer) : TFhirLocationModeList; overload;
Function TFhirMediaTypeListAsInteger(aSet : TFhirMediaTypeList) : Integer; overload;
Function IntegerAsTFhirMediaTypeList(i : integer) : TFhirMediaTypeList; overload;
Function TFhirMedicationKindListAsInteger(aSet : TFhirMedicationKindList) : Integer; overload;
Function IntegerAsTFhirMedicationKindList(i : integer) : TFhirMedicationKindList; overload;
Function TFhirMedicationAdminStatusListAsInteger(aSet : TFhirMedicationAdminStatusList) : Integer; overload;
Function IntegerAsTFhirMedicationAdminStatusList(i : integer) : TFhirMedicationAdminStatusList; overload;
Function TFhirMedicationDispenseStatusListAsInteger(aSet : TFhirMedicationDispenseStatusList) : Integer; overload;
Function IntegerAsTFhirMedicationDispenseStatusList(i : integer) : TFhirMedicationDispenseStatusList; overload;
Function TFhirMedicationPrescriptionStatusListAsInteger(aSet : TFhirMedicationPrescriptionStatusList) : Integer; overload;
Function IntegerAsTFhirMedicationPrescriptionStatusList(i : integer) : TFhirMedicationPrescriptionStatusList; overload;
Function TFhirResponseCodeListAsInteger(aSet : TFhirResponseCodeList) : Integer; overload;
Function IntegerAsTFhirResponseCodeList(i : integer) : TFhirResponseCodeList; overload;
Function TFhirNamingsystemTypeListAsInteger(aSet : TFhirNamingsystemTypeList) : Integer; overload;
Function IntegerAsTFhirNamingsystemTypeList(i : integer) : TFhirNamingsystemTypeList; overload;
Function TFhirNamingsystemStatusListAsInteger(aSet : TFhirNamingsystemStatusList) : Integer; overload;
Function IntegerAsTFhirNamingsystemStatusList(i : integer) : TFhirNamingsystemStatusList; overload;
Function TFhirNamingsystemIdentifierTypeListAsInteger(aSet : TFhirNamingsystemIdentifierTypeList) : Integer; overload;
Function IntegerAsTFhirNamingsystemIdentifierTypeList(i : integer) : TFhirNamingsystemIdentifierTypeList; overload;
Function TFhirNutritionOrderStatusListAsInteger(aSet : TFhirNutritionOrderStatusList) : Integer; overload;
Function IntegerAsTFhirNutritionOrderStatusList(i : integer) : TFhirNutritionOrderStatusList; overload;
Function TFhirDataAbsentReasonListAsInteger(aSet : TFhirDataAbsentReasonList) : Integer; overload;
Function IntegerAsTFhirDataAbsentReasonList(i : integer) : TFhirDataAbsentReasonList; overload;
Function TFhirObservationStatusListAsInteger(aSet : TFhirObservationStatusList) : Integer; overload;
Function IntegerAsTFhirObservationStatusList(i : integer) : TFhirObservationStatusList; overload;
Function TFhirObservationReliabilityListAsInteger(aSet : TFhirObservationReliabilityList) : Integer; overload;
Function IntegerAsTFhirObservationReliabilityList(i : integer) : TFhirObservationReliabilityList; overload;
Function TFhirObservationRelationshiptypesListAsInteger(aSet : TFhirObservationRelationshiptypesList) : Integer; overload;
Function IntegerAsTFhirObservationRelationshiptypesList(i : integer) : TFhirObservationRelationshiptypesList; overload;
Function TFhirOperationKindListAsInteger(aSet : TFhirOperationKindList) : Integer; overload;
Function IntegerAsTFhirOperationKindList(i : integer) : TFhirOperationKindList; overload;
Function TFhirOperationParameterUseListAsInteger(aSet : TFhirOperationParameterUseList) : Integer; overload;
Function IntegerAsTFhirOperationParameterUseList(i : integer) : TFhirOperationParameterUseList; overload;
Function TFhirIssueSeverityListAsInteger(aSet : TFhirIssueSeverityList) : Integer; overload;
Function IntegerAsTFhirIssueSeverityList(i : integer) : TFhirIssueSeverityList; overload;
Function TFhirOrderOutcomeCodeListAsInteger(aSet : TFhirOrderOutcomeCodeList) : Integer; overload;
Function IntegerAsTFhirOrderOutcomeCodeList(i : integer) : TFhirOrderOutcomeCodeList; overload;
Function TFhirAdministrativeGenderListAsInteger(aSet : TFhirAdministrativeGenderList) : Integer; overload;
Function IntegerAsTFhirAdministrativeGenderList(i : integer) : TFhirAdministrativeGenderList; overload;
Function TFhirLinkTypeListAsInteger(aSet : TFhirLinkTypeList) : Integer; overload;
Function IntegerAsTFhirLinkTypeList(i : integer) : TFhirLinkTypeList; overload;
Function TFhirIdentityAssuranceLevelListAsInteger(aSet : TFhirIdentityAssuranceLevelList) : Integer; overload;
Function IntegerAsTFhirIdentityAssuranceLevelList(i : integer) : TFhirIdentityAssuranceLevelList; overload;
Function TFhirProcedureRelationshipTypeListAsInteger(aSet : TFhirProcedureRelationshipTypeList) : Integer; overload;
Function IntegerAsTFhirProcedureRelationshipTypeList(i : integer) : TFhirProcedureRelationshipTypeList; overload;
Function TFhirProcedureRequestStatusListAsInteger(aSet : TFhirProcedureRequestStatusList) : Integer; overload;
Function IntegerAsTFhirProcedureRequestStatusList(i : integer) : TFhirProcedureRequestStatusList; overload;
Function TFhirProcedureRequestPriorityListAsInteger(aSet : TFhirProcedureRequestPriorityList) : Integer; overload;
Function IntegerAsTFhirProcedureRequestPriorityList(i : integer) : TFhirProcedureRequestPriorityList; overload;
Function TFhirProvenanceEntityRoleListAsInteger(aSet : TFhirProvenanceEntityRoleList) : Integer; overload;
Function IntegerAsTFhirProvenanceEntityRoleList(i : integer) : TFhirProvenanceEntityRoleList; overload;
Function TFhirQuestionnaireStatusListAsInteger(aSet : TFhirQuestionnaireStatusList) : Integer; overload;
Function IntegerAsTFhirQuestionnaireStatusList(i : integer) : TFhirQuestionnaireStatusList; overload;
Function TFhirAnswerFormatListAsInteger(aSet : TFhirAnswerFormatList) : Integer; overload;
Function IntegerAsTFhirAnswerFormatList(i : integer) : TFhirAnswerFormatList; overload;
Function TFhirQuestionnaireAnswersStatusListAsInteger(aSet : TFhirQuestionnaireAnswersStatusList) : Integer; overload;
Function IntegerAsTFhirQuestionnaireAnswersStatusList(i : integer) : TFhirQuestionnaireAnswersStatusList; overload;
Function TFhirReferralstatusListAsInteger(aSet : TFhirReferralstatusList) : Integer; overload;
Function IntegerAsTFhirReferralstatusList(i : integer) : TFhirReferralstatusList; overload;
Function TFhirSecurityEventActionListAsInteger(aSet : TFhirSecurityEventActionList) : Integer; overload;
Function IntegerAsTFhirSecurityEventActionList(i : integer) : TFhirSecurityEventActionList; overload;
Function TFhirSecurityEventOutcomeListAsInteger(aSet : TFhirSecurityEventOutcomeList) : Integer; overload;
Function IntegerAsTFhirSecurityEventOutcomeList(i : integer) : TFhirSecurityEventOutcomeList; overload;
Function TFhirNetworkTypeListAsInteger(aSet : TFhirNetworkTypeList) : Integer; overload;
Function IntegerAsTFhirNetworkTypeList(i : integer) : TFhirNetworkTypeList; overload;
Function TFhirObjectTypeListAsInteger(aSet : TFhirObjectTypeList) : Integer; overload;
Function IntegerAsTFhirObjectTypeList(i : integer) : TFhirObjectTypeList; overload;
Function TFhirObjectRoleListAsInteger(aSet : TFhirObjectRoleList) : Integer; overload;
Function IntegerAsTFhirObjectRoleList(i : integer) : TFhirObjectRoleList; overload;
Function TFhirObjectLifecycleListAsInteger(aSet : TFhirObjectLifecycleList) : Integer; overload;
Function IntegerAsTFhirObjectLifecycleList(i : integer) : TFhirObjectLifecycleList; overload;
Function TFhirSlotstatusListAsInteger(aSet : TFhirSlotstatusList) : Integer; overload;
Function IntegerAsTFhirSlotstatusList(i : integer) : TFhirSlotstatusList; overload;
Function TFhirHierarchicalRelationshipTypeListAsInteger(aSet : TFhirHierarchicalRelationshipTypeList) : Integer; overload;
Function IntegerAsTFhirHierarchicalRelationshipTypeList(i : integer) : TFhirHierarchicalRelationshipTypeList; overload;
Function TFhirSubscriptionStatusListAsInteger(aSet : TFhirSubscriptionStatusList) : Integer; overload;
Function IntegerAsTFhirSubscriptionStatusList(i : integer) : TFhirSubscriptionStatusList; overload;
Function TFhirSubscriptionChannelTypeListAsInteger(aSet : TFhirSubscriptionChannelTypeList) : Integer; overload;
Function IntegerAsTFhirSubscriptionChannelTypeList(i : integer) : TFhirSubscriptionChannelTypeList; overload;
Function TFhirValuesetSupplyStatusListAsInteger(aSet : TFhirValuesetSupplyStatusList) : Integer; overload;
Function IntegerAsTFhirValuesetSupplyStatusList(i : integer) : TFhirValuesetSupplyStatusList; overload;
Function TFhirValuesetSupplyDispenseStatusListAsInteger(aSet : TFhirValuesetSupplyDispenseStatusList) : Integer; overload;
Function IntegerAsTFhirValuesetSupplyDispenseStatusList(i : integer) : TFhirValuesetSupplyDispenseStatusList; overload;
Function TFhirFilterOperatorListAsInteger(aSet : TFhirFilterOperatorList) : Integer; overload;
Function IntegerAsTFhirFilterOperatorList(i : integer) : TFhirFilterOperatorList; overload;
Function TFhirEyeCodesListAsInteger(aSet : TFhirEyeCodesList) : Integer; overload;
Function IntegerAsTFhirEyeCodesList(i : integer) : TFhirEyeCodesList; overload;
Function TFhirBaseCodesListAsInteger(aSet : TFhirBaseCodesList) : Integer; overload;
Function IntegerAsTFhirBaseCodesList(i : integer) : TFhirBaseCodesList; overload;

implementation

{ TFhirElement }

constructor TFhirElement.Create;
begin
  inherited;
end;

destructor TFhirElement.Destroy;
begin
  FId.free;
  FExtensionList.Free;
  inherited;
end;

procedure TFhirElement.Assign(oSource : TAdvObject);
begin
  inherited;
  idElement := TFhirElement(oSource).idElement.Clone;
  if (TFhirElement(oSource).FExtensionList = nil) then
  begin
    FExtensionList.free;
    FExtensionList := nil;
  end
  else
  begin
    FExtensionList := TFhirExtensionList.Create;
    FExtensionList.Assign(TFhirElement(oSource).FExtensionList);
  end;
end;

procedure TFhirElement.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'id') Then
     list.add(FId.Link);
  if (child_name = 'extension') Then
    list.addAll(FExtensionList);
end;

procedure TFhirElement.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'id', 'id', FId.Link));{2}
  oList.add(TFHIRProperty.create(self, 'extension', 'Extension', FExtensionList.Link)){3};
end;

procedure TFhirElement.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'id') then IdElement := propValue as TFhirId{5a}
  else if (propName = 'extension') then ExtensionList.add(propValue as TFhirExtension){2}
  else inherited;
end;

function TFhirElement.FhirType : string;
begin
  result := 'Element';
end;

function TFhirElement.Link : TFhirElement;
begin
  result := TFhirElement(inherited Link);
end;

function TFhirElement.Clone : TFhirElement;
begin
  result := TFhirElement(inherited Clone);
end;

{ TFhirElement }

Procedure TFhirElement.SetId(value : TFhirId);
begin
  FId.free;
  FId := value;
end;

Function TFhirElement.GetIdST : String;
begin
  if FId = nil then
    result := ''
  else
    result := FId.value;
end;

Procedure TFhirElement.SetIdST(value : String);
begin
  if value <> '' then
  begin
    if FId = nil then
      FId := TFhirId.create;
    FId.value := value
  end
  else if FId <> nil then
    FId.value := '';
end;

Function TFhirElement.GetExtensionList : TFhirExtensionList;
begin
  if FExtensionList = nil then
    FExtensionList := TFhirExtensionList.Create;
  result := FExtensionList;
end;

Function TFhirElement.GetHasExtensionList : boolean;
begin
  result := (FExtensionList <> nil) and (FExtensionList.count > 0);
end;


{ TFhirElementListEnumerator }

Constructor TFhirElementListEnumerator.Create(list : TFhirElementList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirElementListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirElementListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirElementListEnumerator.GetCurrent : TFhirElement;
begin
  Result := FList[FIndex];
end;


{ TFhirElementList }
procedure TFhirElementList.AddItem(value: TFhirElement);
begin
  assert(value.ClassName = 'TFhirElement', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirElement');
  add(value);
end;


function TFhirElementList.Append: TFhirElement;
begin
  result := TFhirElement.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirElementList.ClearItems;
begin
  Clear;
end;

function TFhirElementList.GetEnumerator : TFhirElementListEnumerator;
begin
  result := TFhirElementListEnumerator.Create(self.link);
end;

function TFhirElementList.Clone: TFhirElementList;
begin
  result := TFhirElementList(inherited Clone);
end;

function TFhirElementList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirElementList.GetItemN(index: Integer): TFhirElement;
begin
  result := TFhirElement(ObjectByIndex[index]);
end;

function TFhirElementList.IndexOf(value: TFhirElement): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirElementList.Insert(index: Integer): TFhirElement;
begin
  result := TFhirElement.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirElementList.InsertItem(index: Integer; value: TFhirElement);
begin
  assert(value is TFhirElement);
  Inherited Insert(index, value);
end;

function TFhirElementList.Item(index: Integer): TFhirElement;
begin
  result := TFhirElement(ObjectByIndex[index]);
end;

function TFhirElementList.Link: TFhirElementList;
begin
  result := TFhirElementList(inherited Link);
end;

procedure TFhirElementList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirElementList.SetItemByIndex(index: Integer; value: TFhirElement);
begin
  assert(value is TFhirElement);
  FhirElements[index] := value;
end;

procedure TFhirElementList.SetItemN(index: Integer; value: TFhirElement);
begin
  assert(value is TFhirElement);
  ObjectByIndex[index] := value;
end;

{ TFhirBackboneElement }

constructor TFhirBackboneElement.Create;
begin
  inherited;
end;

destructor TFhirBackboneElement.Destroy;
begin
  FModifierExtensionList.Free;
  inherited;
end;

procedure TFhirBackboneElement.Assign(oSource : TAdvObject);
begin
  inherited;
  if (TFhirBackboneElement(oSource).FModifierExtensionList = nil) then
  begin
    FModifierExtensionList.free;
    FModifierExtensionList := nil;
  end
  else
  begin
    FModifierExtensionList := TFhirExtensionList.Create;
  FModifierExtensionList.Assign(TFhirBackboneElement(oSource).FModifierExtensionList);
end;
end;

procedure TFhirBackboneElement.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'modifierExtension') Then
    list.addAll(FModifierExtensionList);
end;

procedure TFhirBackboneElement.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'modifierExtension', 'Extension', FModifierExtensionList.Link)){3};
end;

procedure TFhirBackboneElement.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'modifierExtension') then ModifierExtensionList.add(propValue as TFhirExtension){2}
  else inherited;
end;

function TFhirBackboneElement.FhirType : string;
begin
  result := 'BackboneElement';
end;

function TFhirBackboneElement.Link : TFhirBackboneElement;
begin
  result := TFhirBackboneElement(inherited Link);
end;

function TFhirBackboneElement.Clone : TFhirBackboneElement;
begin
  result := TFhirBackboneElement(inherited Clone);
end;

{ TFhirBackboneElement }

Function TFhirBackboneElement.GetModifierExtensionList : TFhirExtensionList;
begin
  if FModifierExtensionList = nil then
    FModifierExtensionList := TFhirExtensionList.Create;
  result := FModifierExtensionList;
end;

Function TFhirBackboneElement.GetHasModifierExtensionList : boolean;
begin
  result := (FModifierExtensionList <> nil) and (FModifierExtensionList.count > 0);
end;


{ TFhirBackboneElementListEnumerator }

Constructor TFhirBackboneElementListEnumerator.Create(list : TFhirBackboneElementList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirBackboneElementListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirBackboneElementListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirBackboneElementListEnumerator.GetCurrent : TFhirBackboneElement;
begin
  Result := FList[FIndex];
end;


{ TFhirBackboneElementList }
procedure TFhirBackboneElementList.AddItem(value: TFhirBackboneElement);
begin
  assert(value.ClassName = 'TFhirBackboneElement', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirBackboneElement');
  add(value);
end;


function TFhirBackboneElementList.Append: TFhirBackboneElement;
begin
  result := TFhirBackboneElement.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirBackboneElementList.ClearItems;
begin
  Clear;
end;

function TFhirBackboneElementList.GetEnumerator : TFhirBackboneElementListEnumerator;
begin
  result := TFhirBackboneElementListEnumerator.Create(self.link);
end;

function TFhirBackboneElementList.Clone: TFhirBackboneElementList;
begin
  result := TFhirBackboneElementList(inherited Clone);
end;

function TFhirBackboneElementList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirBackboneElementList.GetItemN(index: Integer): TFhirBackboneElement;
begin
  result := TFhirBackboneElement(ObjectByIndex[index]);
end;

function TFhirBackboneElementList.IndexOf(value: TFhirBackboneElement): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirBackboneElementList.Insert(index: Integer): TFhirBackboneElement;
begin
  result := TFhirBackboneElement.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirBackboneElementList.InsertItem(index: Integer; value: TFhirBackboneElement);
begin
  assert(value is TFhirBackboneElement);
  Inherited Insert(index, value);
end;

function TFhirBackboneElementList.Item(index: Integer): TFhirBackboneElement;
begin
  result := TFhirBackboneElement(ObjectByIndex[index]);
end;

function TFhirBackboneElementList.Link: TFhirBackboneElementList;
begin
  result := TFhirBackboneElementList(inherited Link);
end;

procedure TFhirBackboneElementList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirBackboneElementList.SetItemByIndex(index: Integer; value: TFhirBackboneElement);
begin
  assert(value is TFhirBackboneElement);
  FhirBackboneElements[index] := value;
end;

procedure TFhirBackboneElementList.SetItemN(index: Integer; value: TFhirBackboneElement);
begin
  assert(value is TFhirBackboneElement);
  ObjectByIndex[index] := value;
end;

{ TFhirType }

function TFhirType.Link : TFhirType;
begin
  result := TFhirType(inherited Link);
end;

function TFhirType.Clone : TFhirType;
begin
  result := TFhirType(inherited Clone);
end;

{ TFHIRPrimitiveType }

function TFHIRPrimitiveType.Link : TFHIRPrimitiveType;
begin
  result := TFHIRPrimitiveType(inherited Link);
end;

function TFHIRPrimitiveType.Clone : TFHIRPrimitiveType;
begin
  result := TFHIRPrimitiveType(inherited Clone);
end;

function TFHIRPrimitiveType.AsStringValue : string;
begin
  raise Exception.create('need to override '+ClassName+'.AsStringValue');
end;


{ TFhirEnum }

Constructor TFhirEnum.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirEnum.Destroy;
begin
  inherited;
end;

function TFhirEnum.FhirType : string;
begin
  result := 'enum';
end;

procedure TFhirEnum.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirEnum.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'enum', FValue));
end;

procedure TFhirEnum.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirEnum(oSource).Value;
end;

function TFhirEnum.Link : TFhirEnum;
begin
  result := TFhirEnum(inherited Link);
end;

function TFhirEnum.Clone : TFhirEnum;
begin
  result := TFhirEnum(inherited Clone);
end;

procedure TFhirEnum.setValue(value : String);
begin
  FValue := value;
end;


{ TFhirEnumListEnumerator }

Constructor TFhirEnumListEnumerator.Create(list : TFhirEnumList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirEnumListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirEnumListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirEnumListEnumerator.GetCurrent : TFhirEnum;
begin
  Result := FList[FIndex];
end;


{ TFhirEnumList }
procedure TFhirEnumList.AddItem(value: TFhirEnum);
begin
  assert(value.ClassName = 'TFhirEnum', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirEnum');
  add(value);
end;


procedure TFhirEnumList.AddItem(value: String);
begin
  add(TFhirEnum.create(value));
end;


function TFhirEnumList.Append: TFhirEnum;
begin
  result := TFhirEnum.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirEnumList.ClearItems;
begin
  Clear;
end;

function TFhirEnumList.GetEnumerator : TFhirEnumListEnumerator;
begin
  result := TFhirEnumListEnumerator.Create(self.link);
end;

function TFhirEnumList.Clone: TFhirEnumList;
begin
  result := TFhirEnumList(inherited Clone);
end;

function TFhirEnumList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirEnumList.GetItemN(index: Integer): TFhirEnum;
begin
  result := TFhirEnum(ObjectByIndex[index]);
end;

function TFhirEnumList.IndexOf(value: TFhirEnum): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirEnumList.Insert(index: Integer): TFhirEnum;
begin
  result := TFhirEnum.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirEnumList.InsertItem(index: Integer; value: TFhirEnum);
begin
  assert(value is TFhirEnum);
  Inherited Insert(index, value);
end;

function TFhirEnumList.Item(index: Integer): TFhirEnum;
begin
  result := TFhirEnum(ObjectByIndex[index]);
end;

function TFhirEnumList.Link: TFhirEnumList;
begin
  result := TFhirEnumList(inherited Link);
end;

procedure TFhirEnumList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirEnumList.SetItemByIndex(index: Integer; value: TFhirEnum);
begin
  assert(value is TFhirEnum);
  FhirEnums[index] := value;
end;

procedure TFhirEnumList.SetItemN(index: Integer; value: TFhirEnum);
begin
  assert(value is TFhirEnum);
  ObjectByIndex[index] := value;
end;

{ TFhirInteger }

Constructor TFhirInteger.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirInteger.Destroy;
begin
  inherited;
end;

function TFhirInteger.FhirType : string;
begin
  result := 'integer';
end;

procedure TFhirInteger.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirInteger.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'integer', FValue));
end;

procedure TFhirInteger.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirInteger(oSource).Value;
end;

function TFhirInteger.Link : TFhirInteger;
begin
  result := TFhirInteger(inherited Link);
end;

function TFhirInteger.Clone : TFhirInteger;
begin
  result := TFhirInteger(inherited Clone);
end;

procedure TFhirInteger.setValue(value : String);
begin
  FValue := value;
end;


{ TFhirIntegerListEnumerator }

Constructor TFhirIntegerListEnumerator.Create(list : TFhirIntegerList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirIntegerListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirIntegerListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirIntegerListEnumerator.GetCurrent : TFhirInteger;
begin
  Result := FList[FIndex];
end;


{ TFhirIntegerList }
procedure TFhirIntegerList.AddItem(value: TFhirInteger);
begin
  assert(value.ClassName = 'TFhirInteger', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirInteger');
  add(value);
end;


procedure TFhirIntegerList.AddItem(value: String);
begin
  add(TFhirInteger.create(value));
end;


function TFhirIntegerList.Append: TFhirInteger;
begin
  result := TFhirInteger.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirIntegerList.ClearItems;
begin
  Clear;
end;

function TFhirIntegerList.GetEnumerator : TFhirIntegerListEnumerator;
begin
  result := TFhirIntegerListEnumerator.Create(self.link);
end;

function TFhirIntegerList.Clone: TFhirIntegerList;
begin
  result := TFhirIntegerList(inherited Clone);
end;

function TFhirIntegerList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirIntegerList.GetItemN(index: Integer): TFhirInteger;
begin
  result := TFhirInteger(ObjectByIndex[index]);
end;

function TFhirIntegerList.IndexOf(value: TFhirInteger): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirIntegerList.Insert(index: Integer): TFhirInteger;
begin
  result := TFhirInteger.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirIntegerList.InsertItem(index: Integer; value: TFhirInteger);
begin
  assert(value is TFhirInteger);
  Inherited Insert(index, value);
end;

function TFhirIntegerList.Item(index: Integer): TFhirInteger;
begin
  result := TFhirInteger(ObjectByIndex[index]);
end;

function TFhirIntegerList.Link: TFhirIntegerList;
begin
  result := TFhirIntegerList(inherited Link);
end;

procedure TFhirIntegerList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirIntegerList.SetItemByIndex(index: Integer; value: TFhirInteger);
begin
  assert(value is TFhirInteger);
  FhirIntegers[index] := value;
end;

procedure TFhirIntegerList.SetItemN(index: Integer; value: TFhirInteger);
begin
  assert(value is TFhirInteger);
  ObjectByIndex[index] := value;
end;

{ TFhirDateTime }

Constructor TFhirDateTime.Create(value : TDateAndTime);
begin
  Create;
  FValue := value;
end;

Destructor TFhirDateTime.Destroy;
begin
  FValue.free;
  inherited;
end;

function TFhirDateTime.FhirType : string;
begin
  result := 'dateTime';
end;

procedure TFhirDateTime.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirDateTime.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'dateTime', FValue.toString));
end;

procedure TFhirDateTime.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirDateTime(oSource).Value.Link;
end;

function TFhirDateTime.Link : TFhirDateTime;
begin
  result := TFhirDateTime(inherited Link);
end;

function TFhirDateTime.Clone : TFhirDateTime;
begin
  result := TFhirDateTime(inherited Clone);
end;

procedure TFhirDateTime.setValue(value : TDateAndTime);
begin
  FValue.free;
  FValue := value;
end;


{ TFhirDateTimeListEnumerator }

Constructor TFhirDateTimeListEnumerator.Create(list : TFhirDateTimeList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirDateTimeListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirDateTimeListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirDateTimeListEnumerator.GetCurrent : TFhirDateTime;
begin
  Result := FList[FIndex];
end;


{ TFhirDateTimeList }
procedure TFhirDateTimeList.AddItem(value: TFhirDateTime);
begin
  assert(value.ClassName = 'TFhirDateTime', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirDateTime');
  add(value);
end;


procedure TFhirDateTimeList.AddItem(value: TDateAndTime);
begin
  add(TFhirDateTime.create(value));
end;


function TFhirDateTimeList.Append: TFhirDateTime;
begin
  result := TFhirDateTime.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirDateTimeList.ClearItems;
begin
  Clear;
end;

function TFhirDateTimeList.GetEnumerator : TFhirDateTimeListEnumerator;
begin
  result := TFhirDateTimeListEnumerator.Create(self.link);
end;

function TFhirDateTimeList.Clone: TFhirDateTimeList;
begin
  result := TFhirDateTimeList(inherited Clone);
end;

function TFhirDateTimeList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirDateTimeList.GetItemN(index: Integer): TFhirDateTime;
begin
  result := TFhirDateTime(ObjectByIndex[index]);
end;

function TFhirDateTimeList.IndexOf(value: TFhirDateTime): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirDateTimeList.Insert(index: Integer): TFhirDateTime;
begin
  result := TFhirDateTime.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirDateTimeList.InsertItem(index: Integer; value: TFhirDateTime);
begin
  assert(value is TFhirDateTime);
  Inherited Insert(index, value);
end;

function TFhirDateTimeList.Item(index: Integer): TFhirDateTime;
begin
  result := TFhirDateTime(ObjectByIndex[index]);
end;

function TFhirDateTimeList.Link: TFhirDateTimeList;
begin
  result := TFhirDateTimeList(inherited Link);
end;

procedure TFhirDateTimeList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirDateTimeList.SetItemByIndex(index: Integer; value: TFhirDateTime);
begin
  assert(value is TFhirDateTime);
  FhirDateTimes[index] := value;
end;

procedure TFhirDateTimeList.SetItemN(index: Integer; value: TFhirDateTime);
begin
  assert(value is TFhirDateTime);
  ObjectByIndex[index] := value;
end;

{ TFhirDate }

Constructor TFhirDate.Create(value : TDateAndTime);
begin
  Create;
  FValue := value;
end;

Destructor TFhirDate.Destroy;
begin
  FValue.free;
  inherited;
end;

function TFhirDate.FhirType : string;
begin
  result := 'date';
end;

procedure TFhirDate.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirDate.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'date', FValue.toString));
end;

procedure TFhirDate.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirDate(oSource).Value.Link;
end;

function TFhirDate.Link : TFhirDate;
begin
  result := TFhirDate(inherited Link);
end;

function TFhirDate.Clone : TFhirDate;
begin
  result := TFhirDate(inherited Clone);
end;

procedure TFhirDate.setValue(value : TDateAndTime);
begin
  FValue.free;
  FValue := value;
end;


{ TFhirDateListEnumerator }

Constructor TFhirDateListEnumerator.Create(list : TFhirDateList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirDateListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirDateListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirDateListEnumerator.GetCurrent : TFhirDate;
begin
  Result := FList[FIndex];
end;


{ TFhirDateList }
procedure TFhirDateList.AddItem(value: TFhirDate);
begin
  assert(value.ClassName = 'TFhirDate', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirDate');
  add(value);
end;


procedure TFhirDateList.AddItem(value: TDateAndTime);
begin
  add(TFhirDate.create(value));
end;


function TFhirDateList.Append: TFhirDate;
begin
  result := TFhirDate.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirDateList.ClearItems;
begin
  Clear;
end;

function TFhirDateList.GetEnumerator : TFhirDateListEnumerator;
begin
  result := TFhirDateListEnumerator.Create(self.link);
end;

function TFhirDateList.Clone: TFhirDateList;
begin
  result := TFhirDateList(inherited Clone);
end;

function TFhirDateList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirDateList.GetItemN(index: Integer): TFhirDate;
begin
  result := TFhirDate(ObjectByIndex[index]);
end;

function TFhirDateList.IndexOf(value: TFhirDate): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirDateList.Insert(index: Integer): TFhirDate;
begin
  result := TFhirDate.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirDateList.InsertItem(index: Integer; value: TFhirDate);
begin
  assert(value is TFhirDate);
  Inherited Insert(index, value);
end;

function TFhirDateList.Item(index: Integer): TFhirDate;
begin
  result := TFhirDate(ObjectByIndex[index]);
end;

function TFhirDateList.Link: TFhirDateList;
begin
  result := TFhirDateList(inherited Link);
end;

procedure TFhirDateList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirDateList.SetItemByIndex(index: Integer; value: TFhirDate);
begin
  assert(value is TFhirDate);
  FhirDates[index] := value;
end;

procedure TFhirDateList.SetItemN(index: Integer; value: TFhirDate);
begin
  assert(value is TFhirDate);
  ObjectByIndex[index] := value;
end;

{ TFhirDecimal }

Constructor TFhirDecimal.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirDecimal.Destroy;
begin
  inherited;
end;

function TFhirDecimal.FhirType : string;
begin
  result := 'decimal';
end;

procedure TFhirDecimal.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirDecimal.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'decimal', FValue));
end;

procedure TFhirDecimal.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirDecimal(oSource).Value;
end;

function TFhirDecimal.Link : TFhirDecimal;
begin
  result := TFhirDecimal(inherited Link);
end;

function TFhirDecimal.Clone : TFhirDecimal;
begin
  result := TFhirDecimal(inherited Clone);
end;

procedure TFhirDecimal.setValue(value : String);
begin
  FValue := value;
end;


{ TFhirDecimalListEnumerator }

Constructor TFhirDecimalListEnumerator.Create(list : TFhirDecimalList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirDecimalListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirDecimalListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirDecimalListEnumerator.GetCurrent : TFhirDecimal;
begin
  Result := FList[FIndex];
end;


{ TFhirDecimalList }
procedure TFhirDecimalList.AddItem(value: TFhirDecimal);
begin
  assert(value.ClassName = 'TFhirDecimal', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirDecimal');
  add(value);
end;


procedure TFhirDecimalList.AddItem(value: String);
begin
  add(TFhirDecimal.create(value));
end;


function TFhirDecimalList.Append: TFhirDecimal;
begin
  result := TFhirDecimal.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirDecimalList.ClearItems;
begin
  Clear;
end;

function TFhirDecimalList.GetEnumerator : TFhirDecimalListEnumerator;
begin
  result := TFhirDecimalListEnumerator.Create(self.link);
end;

function TFhirDecimalList.Clone: TFhirDecimalList;
begin
  result := TFhirDecimalList(inherited Clone);
end;

function TFhirDecimalList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirDecimalList.GetItemN(index: Integer): TFhirDecimal;
begin
  result := TFhirDecimal(ObjectByIndex[index]);
end;

function TFhirDecimalList.IndexOf(value: TFhirDecimal): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirDecimalList.Insert(index: Integer): TFhirDecimal;
begin
  result := TFhirDecimal.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirDecimalList.InsertItem(index: Integer; value: TFhirDecimal);
begin
  assert(value is TFhirDecimal);
  Inherited Insert(index, value);
end;

function TFhirDecimalList.Item(index: Integer): TFhirDecimal;
begin
  result := TFhirDecimal(ObjectByIndex[index]);
end;

function TFhirDecimalList.Link: TFhirDecimalList;
begin
  result := TFhirDecimalList(inherited Link);
end;

procedure TFhirDecimalList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirDecimalList.SetItemByIndex(index: Integer; value: TFhirDecimal);
begin
  assert(value is TFhirDecimal);
  FhirDecimals[index] := value;
end;

procedure TFhirDecimalList.SetItemN(index: Integer; value: TFhirDecimal);
begin
  assert(value is TFhirDecimal);
  ObjectByIndex[index] := value;
end;

{ TFhirUri }

Constructor TFhirUri.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirUri.Destroy;
begin
  inherited;
end;

function TFhirUri.FhirType : string;
begin
  result := 'uri';
end;

procedure TFhirUri.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirUri.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'uri', FValue));
end;

procedure TFhirUri.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirUri(oSource).Value;
end;

function TFhirUri.Link : TFhirUri;
begin
  result := TFhirUri(inherited Link);
end;

function TFhirUri.Clone : TFhirUri;
begin
  result := TFhirUri(inherited Clone);
end;

procedure TFhirUri.setValue(value : String);
begin
  FValue := value;
end;


{ TFhirUriListEnumerator }

Constructor TFhirUriListEnumerator.Create(list : TFhirUriList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirUriListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirUriListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirUriListEnumerator.GetCurrent : TFhirUri;
begin
  Result := FList[FIndex];
end;


{ TFhirUriList }
procedure TFhirUriList.AddItem(value: TFhirUri);
begin
  assert(value.ClassName = 'TFhirUri', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirUri');
  add(value);
end;


procedure TFhirUriList.AddItem(value: String);
begin
  add(TFhirUri.create(value));
end;


function TFhirUriList.Append: TFhirUri;
begin
  result := TFhirUri.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirUriList.ClearItems;
begin
  Clear;
end;

function TFhirUriList.GetEnumerator : TFhirUriListEnumerator;
begin
  result := TFhirUriListEnumerator.Create(self.link);
end;

function TFhirUriList.Clone: TFhirUriList;
begin
  result := TFhirUriList(inherited Clone);
end;

function TFhirUriList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirUriList.GetItemN(index: Integer): TFhirUri;
begin
  result := TFhirUri(ObjectByIndex[index]);
end;

function TFhirUriList.IndexOf(value: TFhirUri): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirUriList.Insert(index: Integer): TFhirUri;
begin
  result := TFhirUri.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirUriList.InsertItem(index: Integer; value: TFhirUri);
begin
  assert(value is TFhirUri);
  Inherited Insert(index, value);
end;

function TFhirUriList.Item(index: Integer): TFhirUri;
begin
  result := TFhirUri(ObjectByIndex[index]);
end;

function TFhirUriList.Link: TFhirUriList;
begin
  result := TFhirUriList(inherited Link);
end;

procedure TFhirUriList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirUriList.SetItemByIndex(index: Integer; value: TFhirUri);
begin
  assert(value is TFhirUri);
  FhirUris[index] := value;
end;

procedure TFhirUriList.SetItemN(index: Integer; value: TFhirUri);
begin
  assert(value is TFhirUri);
  ObjectByIndex[index] := value;
end;

{ TFhirBase64Binary }

Constructor TFhirBase64Binary.Create(value : TBytes);
begin
  Create;
  FValue := value;
end;

Destructor TFhirBase64Binary.Destroy;
begin
  inherited;
end;

function TFhirBase64Binary.FhirType : string;
begin
  result := 'base64Binary';
end;

procedure TFhirBase64Binary.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirBase64Binary.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'base64Binary', FValue));
end;

procedure TFhirBase64Binary.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirBase64Binary(oSource).Value;
end;

function TFhirBase64Binary.Link : TFhirBase64Binary;
begin
  result := TFhirBase64Binary(inherited Link);
end;

function TFhirBase64Binary.Clone : TFhirBase64Binary;
begin
  result := TFhirBase64Binary(inherited Clone);
end;

procedure TFhirBase64Binary.setValue(value : TBytes);
begin
  FValue := value;
end;


{ TFhirBase64BinaryListEnumerator }

Constructor TFhirBase64BinaryListEnumerator.Create(list : TFhirBase64BinaryList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirBase64BinaryListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirBase64BinaryListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirBase64BinaryListEnumerator.GetCurrent : TFhirBase64Binary;
begin
  Result := FList[FIndex];
end;


{ TFhirBase64BinaryList }
procedure TFhirBase64BinaryList.AddItem(value: TFhirBase64Binary);
begin
  assert(value.ClassName = 'TFhirBase64Binary', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirBase64Binary');
  add(value);
end;


procedure TFhirBase64BinaryList.AddItem(value: TBytes);
begin
  add(TFhirBase64Binary.create(value));
end;


function TFhirBase64BinaryList.Append: TFhirBase64Binary;
begin
  result := TFhirBase64Binary.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirBase64BinaryList.ClearItems;
begin
  Clear;
end;

function TFhirBase64BinaryList.GetEnumerator : TFhirBase64BinaryListEnumerator;
begin
  result := TFhirBase64BinaryListEnumerator.Create(self.link);
end;

function TFhirBase64BinaryList.Clone: TFhirBase64BinaryList;
begin
  result := TFhirBase64BinaryList(inherited Clone);
end;

function TFhirBase64BinaryList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirBase64BinaryList.GetItemN(index: Integer): TFhirBase64Binary;
begin
  result := TFhirBase64Binary(ObjectByIndex[index]);
end;

function TFhirBase64BinaryList.IndexOf(value: TFhirBase64Binary): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirBase64BinaryList.Insert(index: Integer): TFhirBase64Binary;
begin
  result := TFhirBase64Binary.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirBase64BinaryList.InsertItem(index: Integer; value: TFhirBase64Binary);
begin
  assert(value is TFhirBase64Binary);
  Inherited Insert(index, value);
end;

function TFhirBase64BinaryList.Item(index: Integer): TFhirBase64Binary;
begin
  result := TFhirBase64Binary(ObjectByIndex[index]);
end;

function TFhirBase64BinaryList.Link: TFhirBase64BinaryList;
begin
  result := TFhirBase64BinaryList(inherited Link);
end;

procedure TFhirBase64BinaryList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirBase64BinaryList.SetItemByIndex(index: Integer; value: TFhirBase64Binary);
begin
  assert(value is TFhirBase64Binary);
  FhirBase64Binaries[index] := value;
end;

procedure TFhirBase64BinaryList.SetItemN(index: Integer; value: TFhirBase64Binary);
begin
  assert(value is TFhirBase64Binary);
  ObjectByIndex[index] := value;
end;

{ TFhirTime }

Constructor TFhirTime.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirTime.Destroy;
begin
  inherited;
end;

function TFhirTime.FhirType : string;
begin
  result := 'time';
end;

procedure TFhirTime.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirTime.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'time', FValue));
end;

procedure TFhirTime.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirTime(oSource).Value;
end;

function TFhirTime.Link : TFhirTime;
begin
  result := TFhirTime(inherited Link);
end;

function TFhirTime.Clone : TFhirTime;
begin
  result := TFhirTime(inherited Clone);
end;

procedure TFhirTime.setValue(value : String);
begin
  FValue := value;
end;


{ TFhirTimeListEnumerator }

Constructor TFhirTimeListEnumerator.Create(list : TFhirTimeList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirTimeListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirTimeListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirTimeListEnumerator.GetCurrent : TFhirTime;
begin
  Result := FList[FIndex];
end;


{ TFhirTimeList }
procedure TFhirTimeList.AddItem(value: TFhirTime);
begin
  assert(value.ClassName = 'TFhirTime', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirTime');
  add(value);
end;


procedure TFhirTimeList.AddItem(value: String);
begin
  add(TFhirTime.create(value));
end;


function TFhirTimeList.Append: TFhirTime;
begin
  result := TFhirTime.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirTimeList.ClearItems;
begin
  Clear;
end;

function TFhirTimeList.GetEnumerator : TFhirTimeListEnumerator;
begin
  result := TFhirTimeListEnumerator.Create(self.link);
end;

function TFhirTimeList.Clone: TFhirTimeList;
begin
  result := TFhirTimeList(inherited Clone);
end;

function TFhirTimeList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirTimeList.GetItemN(index: Integer): TFhirTime;
begin
  result := TFhirTime(ObjectByIndex[index]);
end;

function TFhirTimeList.IndexOf(value: TFhirTime): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirTimeList.Insert(index: Integer): TFhirTime;
begin
  result := TFhirTime.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirTimeList.InsertItem(index: Integer; value: TFhirTime);
begin
  assert(value is TFhirTime);
  Inherited Insert(index, value);
end;

function TFhirTimeList.Item(index: Integer): TFhirTime;
begin
  result := TFhirTime(ObjectByIndex[index]);
end;

function TFhirTimeList.Link: TFhirTimeList;
begin
  result := TFhirTimeList(inherited Link);
end;

procedure TFhirTimeList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirTimeList.SetItemByIndex(index: Integer; value: TFhirTime);
begin
  assert(value is TFhirTime);
  FhirTimes[index] := value;
end;

procedure TFhirTimeList.SetItemN(index: Integer; value: TFhirTime);
begin
  assert(value is TFhirTime);
  ObjectByIndex[index] := value;
end;

{ TFhirString }

Constructor TFhirString.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirString.Destroy;
begin
  inherited;
end;

function TFhirString.FhirType : string;
begin
  result := 'string';
end;

procedure TFhirString.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirString.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'string', FValue));
end;

procedure TFhirString.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirString(oSource).Value;
end;

function TFhirString.Link : TFhirString;
begin
  result := TFhirString(inherited Link);
end;

function TFhirString.Clone : TFhirString;
begin
  result := TFhirString(inherited Clone);
end;

procedure TFhirString.setValue(value : String);
begin
  FValue := value;
end;


{ TFhirStringListEnumerator }

Constructor TFhirStringListEnumerator.Create(list : TFhirStringList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirStringListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirStringListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirStringListEnumerator.GetCurrent : TFhirString;
begin
  Result := FList[FIndex];
end;


{ TFhirStringList }
procedure TFhirStringList.AddItem(value: TFhirString);
begin
  assert(value.ClassName = 'TFhirString', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirString');
  add(value);
end;


procedure TFhirStringList.AddItem(value: String);
begin
  add(TFhirString.create(value));
end;


function TFhirStringList.Append: TFhirString;
begin
  result := TFhirString.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirStringList.ClearItems;
begin
  Clear;
end;

function TFhirStringList.GetEnumerator : TFhirStringListEnumerator;
begin
  result := TFhirStringListEnumerator.Create(self.link);
end;

function TFhirStringList.Clone: TFhirStringList;
begin
  result := TFhirStringList(inherited Clone);
end;

function TFhirStringList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirStringList.GetItemN(index: Integer): TFhirString;
begin
  result := TFhirString(ObjectByIndex[index]);
end;

function TFhirStringList.IndexOf(value: TFhirString): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirStringList.Insert(index: Integer): TFhirString;
begin
  result := TFhirString.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirStringList.InsertItem(index: Integer; value: TFhirString);
begin
  assert(value is TFhirString);
  Inherited Insert(index, value);
end;

function TFhirStringList.Item(index: Integer): TFhirString;
begin
  result := TFhirString(ObjectByIndex[index]);
end;

function TFhirStringList.Link: TFhirStringList;
begin
  result := TFhirStringList(inherited Link);
end;

procedure TFhirStringList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirStringList.SetItemByIndex(index: Integer; value: TFhirString);
begin
  assert(value is TFhirString);
  FhirStrings[index] := value;
end;

procedure TFhirStringList.SetItemN(index: Integer; value: TFhirString);
begin
  assert(value is TFhirString);
  ObjectByIndex[index] := value;
end;

{ TFhirBoolean }

Constructor TFhirBoolean.Create(value : Boolean);
begin
  Create;
  FValue := value;
end;

Destructor TFhirBoolean.Destroy;
begin
  inherited;
end;

function TFhirBoolean.FhirType : string;
begin
  result := 'boolean';
end;

procedure TFhirBoolean.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirBoolean.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'boolean', LCBooleanToString(FValue)));
end;

procedure TFhirBoolean.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirBoolean(oSource).Value;
end;

function TFhirBoolean.Link : TFhirBoolean;
begin
  result := TFhirBoolean(inherited Link);
end;

function TFhirBoolean.Clone : TFhirBoolean;
begin
  result := TFhirBoolean(inherited Clone);
end;

procedure TFhirBoolean.setValue(value : Boolean);
begin
  FValue := value;
end;


{ TFhirBooleanListEnumerator }

Constructor TFhirBooleanListEnumerator.Create(list : TFhirBooleanList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirBooleanListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirBooleanListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirBooleanListEnumerator.GetCurrent : TFhirBoolean;
begin
  Result := FList[FIndex];
end;


{ TFhirBooleanList }
procedure TFhirBooleanList.AddItem(value: TFhirBoolean);
begin
  assert(value.ClassName = 'TFhirBoolean', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirBoolean');
  add(value);
end;


procedure TFhirBooleanList.AddItem(value: Boolean);
begin
  add(TFhirBoolean.create(value));
end;


function TFhirBooleanList.Append: TFhirBoolean;
begin
  result := TFhirBoolean.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirBooleanList.ClearItems;
begin
  Clear;
end;

function TFhirBooleanList.GetEnumerator : TFhirBooleanListEnumerator;
begin
  result := TFhirBooleanListEnumerator.Create(self.link);
end;

function TFhirBooleanList.Clone: TFhirBooleanList;
begin
  result := TFhirBooleanList(inherited Clone);
end;

function TFhirBooleanList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirBooleanList.GetItemN(index: Integer): TFhirBoolean;
begin
  result := TFhirBoolean(ObjectByIndex[index]);
end;

function TFhirBooleanList.IndexOf(value: TFhirBoolean): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirBooleanList.Insert(index: Integer): TFhirBoolean;
begin
  result := TFhirBoolean.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirBooleanList.InsertItem(index: Integer; value: TFhirBoolean);
begin
  assert(value is TFhirBoolean);
  Inherited Insert(index, value);
end;

function TFhirBooleanList.Item(index: Integer): TFhirBoolean;
begin
  result := TFhirBoolean(ObjectByIndex[index]);
end;

function TFhirBooleanList.Link: TFhirBooleanList;
begin
  result := TFhirBooleanList(inherited Link);
end;

procedure TFhirBooleanList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirBooleanList.SetItemByIndex(index: Integer; value: TFhirBoolean);
begin
  assert(value is TFhirBoolean);
  FhirBooleans[index] := value;
end;

procedure TFhirBooleanList.SetItemN(index: Integer; value: TFhirBoolean);
begin
  assert(value is TFhirBoolean);
  ObjectByIndex[index] := value;
end;

{ TFhirInstant }

Constructor TFhirInstant.Create(value : TDateAndTime);
begin
  Create;
  FValue := value;
end;

Destructor TFhirInstant.Destroy;
begin
  FValue.free;
  inherited;
end;

function TFhirInstant.FhirType : string;
begin
  result := 'instant';
end;

procedure TFhirInstant.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if child_name = 'value' then
    list.add(TFHIRObjectText.create(value));
end;

procedure TFhirInstant.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'instant', FValue.toString));
end;

procedure TFhirInstant.Assign(oSource : TAdvObject);
begin
  inherited;
  FValue := TFhirInstant(oSource).Value.Link;
end;

function TFhirInstant.Link : TFhirInstant;
begin
  result := TFhirInstant(inherited Link);
end;

function TFhirInstant.Clone : TFhirInstant;
begin
  result := TFhirInstant(inherited Clone);
end;

procedure TFhirInstant.setValue(value : TDateAndTime);
begin
  FValue.free;
  FValue := value;
end;


{ TFhirInstantListEnumerator }

Constructor TFhirInstantListEnumerator.Create(list : TFhirInstantList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirInstantListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirInstantListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirInstantListEnumerator.GetCurrent : TFhirInstant;
begin
  Result := FList[FIndex];
end;


{ TFhirInstantList }
procedure TFhirInstantList.AddItem(value: TFhirInstant);
begin
  assert(value.ClassName = 'TFhirInstant', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirInstant');
  add(value);
end;


procedure TFhirInstantList.AddItem(value: TDateAndTime);
begin
  add(TFhirInstant.create(value));
end;


function TFhirInstantList.Append: TFhirInstant;
begin
  result := TFhirInstant.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirInstantList.ClearItems;
begin
  Clear;
end;

function TFhirInstantList.GetEnumerator : TFhirInstantListEnumerator;
begin
  result := TFhirInstantListEnumerator.Create(self.link);
end;

function TFhirInstantList.Clone: TFhirInstantList;
begin
  result := TFhirInstantList(inherited Clone);
end;

function TFhirInstantList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirInstantList.GetItemN(index: Integer): TFhirInstant;
begin
  result := TFhirInstant(ObjectByIndex[index]);
end;

function TFhirInstantList.IndexOf(value: TFhirInstant): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirInstantList.Insert(index: Integer): TFhirInstant;
begin
  result := TFhirInstant.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirInstantList.InsertItem(index: Integer; value: TFhirInstant);
begin
  assert(value is TFhirInstant);
  Inherited Insert(index, value);
end;

function TFhirInstantList.Item(index: Integer): TFhirInstant;
begin
  result := TFhirInstant(ObjectByIndex[index]);
end;

function TFhirInstantList.Link: TFhirInstantList;
begin
  result := TFhirInstantList(inherited Link);
end;

procedure TFhirInstantList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirInstantList.SetItemByIndex(index: Integer; value: TFhirInstant);
begin
  assert(value is TFhirInstant);
  FhirInstants[index] := value;
end;

procedure TFhirInstantList.SetItemN(index: Integer; value: TFhirInstant);
begin
  assert(value is TFhirInstant);
  ObjectByIndex[index] := value;
end;

{ TFhirCode }

Constructor TFhirCode.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirCode.Destroy;
begin
  inherited;
end;

function TFhirCode.FhirType : string;
begin
  result := 'code';
end;

function TFhirCode.Link : TFhirCode;
begin
  result := TFhirCode(inherited Link);
end;

function TFhirCode.Clone : TFhirCode;
begin
  result := TFhirCode(inherited Clone);
end;


{ TFhirCodeListEnumerator }

Constructor TFhirCodeListEnumerator.Create(list : TFhirCodeList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirCodeListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirCodeListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirCodeListEnumerator.GetCurrent : TFhirCode;
begin
  Result := FList[FIndex];
end;


{ TFhirCodeList }
procedure TFhirCodeList.AddItem(value: TFhirCode);
begin
  assert(value.ClassName = 'TFhirCode', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirCode');
  add(value);
end;


procedure TFhirCodeList.AddItem(value: String);
begin
  add(TFhirCode.create(value));
end;


function TFhirCodeList.Append: TFhirCode;
begin
  result := TFhirCode.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirCodeList.ClearItems;
begin
  Clear;
end;

function TFhirCodeList.GetEnumerator : TFhirCodeListEnumerator;
begin
  result := TFhirCodeListEnumerator.Create(self.link);
end;

function TFhirCodeList.Clone: TFhirCodeList;
begin
  result := TFhirCodeList(inherited Clone);
end;

function TFhirCodeList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirCodeList.GetItemN(index: Integer): TFhirCode;
begin
  result := TFhirCode(ObjectByIndex[index]);
end;

function TFhirCodeList.IndexOf(value: TFhirCode): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirCodeList.Insert(index: Integer): TFhirCode;
begin
  result := TFhirCode.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirCodeList.InsertItem(index: Integer; value: TFhirCode);
begin
  assert(value is TFhirCode);
  Inherited Insert(index, value);
end;

function TFhirCodeList.Item(index: Integer): TFhirCode;
begin
  result := TFhirCode(ObjectByIndex[index]);
end;

function TFhirCodeList.Link: TFhirCodeList;
begin
  result := TFhirCodeList(inherited Link);
end;

procedure TFhirCodeList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirCodeList.SetItemByIndex(index: Integer; value: TFhirCode);
begin
  assert(value is TFhirCode);
  FhirCodes[index] := value;
end;

procedure TFhirCodeList.SetItemN(index: Integer; value: TFhirCode);
begin
  assert(value is TFhirCode);
  ObjectByIndex[index] := value;
end;

{ TFhirId }

Constructor TFhirId.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirId.Destroy;
begin
  inherited;
end;

function TFhirId.FhirType : string;
begin
  result := 'id';
end;

function TFhirId.Link : TFhirId;
begin
  result := TFhirId(inherited Link);
end;

function TFhirId.Clone : TFhirId;
begin
  result := TFhirId(inherited Clone);
end;


{ TFhirIdListEnumerator }

Constructor TFhirIdListEnumerator.Create(list : TFhirIdList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirIdListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirIdListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirIdListEnumerator.GetCurrent : TFhirId;
begin
  Result := FList[FIndex];
end;


{ TFhirIdList }
procedure TFhirIdList.AddItem(value: TFhirId);
begin
  assert(value.ClassName = 'TFhirId', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirId');
  add(value);
end;


procedure TFhirIdList.AddItem(value: String);
begin
  add(TFhirId.create(value));
end;


function TFhirIdList.Append: TFhirId;
begin
  result := TFhirId.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirIdList.ClearItems;
begin
  Clear;
end;

function TFhirIdList.GetEnumerator : TFhirIdListEnumerator;
begin
  result := TFhirIdListEnumerator.Create(self.link);
end;

function TFhirIdList.Clone: TFhirIdList;
begin
  result := TFhirIdList(inherited Clone);
end;

function TFhirIdList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirIdList.GetItemN(index: Integer): TFhirId;
begin
  result := TFhirId(ObjectByIndex[index]);
end;

function TFhirIdList.IndexOf(value: TFhirId): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirIdList.Insert(index: Integer): TFhirId;
begin
  result := TFhirId.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirIdList.InsertItem(index: Integer; value: TFhirId);
begin
  assert(value is TFhirId);
  Inherited Insert(index, value);
end;

function TFhirIdList.Item(index: Integer): TFhirId;
begin
  result := TFhirId(ObjectByIndex[index]);
end;

function TFhirIdList.Link: TFhirIdList;
begin
  result := TFhirIdList(inherited Link);
end;

procedure TFhirIdList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirIdList.SetItemByIndex(index: Integer; value: TFhirId);
begin
  assert(value is TFhirId);
  FhirIds[index] := value;
end;

procedure TFhirIdList.SetItemN(index: Integer; value: TFhirId);
begin
  assert(value is TFhirId);
  ObjectByIndex[index] := value;
end;

{ TFhirOid }

Constructor TFhirOid.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirOid.Destroy;
begin
  inherited;
end;

function TFhirOid.FhirType : string;
begin
  result := 'oid';
end;

function TFhirOid.Link : TFhirOid;
begin
  result := TFhirOid(inherited Link);
end;

function TFhirOid.Clone : TFhirOid;
begin
  result := TFhirOid(inherited Clone);
end;


{ TFhirOidListEnumerator }

Constructor TFhirOidListEnumerator.Create(list : TFhirOidList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirOidListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirOidListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirOidListEnumerator.GetCurrent : TFhirOid;
begin
  Result := FList[FIndex];
end;


{ TFhirOidList }
procedure TFhirOidList.AddItem(value: TFhirOid);
begin
  assert(value.ClassName = 'TFhirOid', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirOid');
  add(value);
end;


procedure TFhirOidList.AddItem(value: String);
begin
  add(TFhirOid.create(value));
end;


function TFhirOidList.Append: TFhirOid;
begin
  result := TFhirOid.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirOidList.ClearItems;
begin
  Clear;
end;

function TFhirOidList.GetEnumerator : TFhirOidListEnumerator;
begin
  result := TFhirOidListEnumerator.Create(self.link);
end;

function TFhirOidList.Clone: TFhirOidList;
begin
  result := TFhirOidList(inherited Clone);
end;

function TFhirOidList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirOidList.GetItemN(index: Integer): TFhirOid;
begin
  result := TFhirOid(ObjectByIndex[index]);
end;

function TFhirOidList.IndexOf(value: TFhirOid): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirOidList.Insert(index: Integer): TFhirOid;
begin
  result := TFhirOid.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirOidList.InsertItem(index: Integer; value: TFhirOid);
begin
  assert(value is TFhirOid);
  Inherited Insert(index, value);
end;

function TFhirOidList.Item(index: Integer): TFhirOid;
begin
  result := TFhirOid(ObjectByIndex[index]);
end;

function TFhirOidList.Link: TFhirOidList;
begin
  result := TFhirOidList(inherited Link);
end;

procedure TFhirOidList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirOidList.SetItemByIndex(index: Integer; value: TFhirOid);
begin
  assert(value is TFhirOid);
  FhirOids[index] := value;
end;

procedure TFhirOidList.SetItemN(index: Integer; value: TFhirOid);
begin
  assert(value is TFhirOid);
  ObjectByIndex[index] := value;
end;

{ TFhirUuid }

Constructor TFhirUuid.Create(value : String);
begin
  Create;
  FValue := value;
end;

Destructor TFhirUuid.Destroy;
begin
  inherited;
end;

function TFhirUuid.FhirType : string;
begin
  result := 'uuid';
end;

function TFhirUuid.Link : TFhirUuid;
begin
  result := TFhirUuid(inherited Link);
end;

function TFhirUuid.Clone : TFhirUuid;
begin
  result := TFhirUuid(inherited Clone);
end;


{ TFhirUuidListEnumerator }

Constructor TFhirUuidListEnumerator.Create(list : TFhirUuidList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirUuidListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirUuidListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirUuidListEnumerator.GetCurrent : TFhirUuid;
begin
  Result := FList[FIndex];
end;


{ TFhirUuidList }
procedure TFhirUuidList.AddItem(value: TFhirUuid);
begin
  assert(value.ClassName = 'TFhirUuid', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirUuid');
  add(value);
end;


procedure TFhirUuidList.AddItem(value: String);
begin
  add(TFhirUuid.create(value));
end;


function TFhirUuidList.Append: TFhirUuid;
begin
  result := TFhirUuid.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirUuidList.ClearItems;
begin
  Clear;
end;

function TFhirUuidList.GetEnumerator : TFhirUuidListEnumerator;
begin
  result := TFhirUuidListEnumerator.Create(self.link);
end;

function TFhirUuidList.Clone: TFhirUuidList;
begin
  result := TFhirUuidList(inherited Clone);
end;

function TFhirUuidList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirUuidList.GetItemN(index: Integer): TFhirUuid;
begin
  result := TFhirUuid(ObjectByIndex[index]);
end;

function TFhirUuidList.IndexOf(value: TFhirUuid): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirUuidList.Insert(index: Integer): TFhirUuid;
begin
  result := TFhirUuid.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirUuidList.InsertItem(index: Integer; value: TFhirUuid);
begin
  assert(value is TFhirUuid);
  Inherited Insert(index, value);
end;

function TFhirUuidList.Item(index: Integer): TFhirUuid;
begin
  result := TFhirUuid(ObjectByIndex[index]);
end;

function TFhirUuidList.Link: TFhirUuidList;
begin
  result := TFhirUuidList(inherited Link);
end;

procedure TFhirUuidList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirUuidList.SetItemByIndex(index: Integer; value: TFhirUuid);
begin
  assert(value is TFhirUuid);
  FhirUuids[index] := value;
end;

procedure TFhirUuidList.SetItemN(index: Integer; value: TFhirUuid);
begin
  assert(value is TFhirUuid);
  ObjectByIndex[index] := value;
end;

{ TFhirExtension }

constructor TFhirExtension.Create;
begin
  inherited;
end;

destructor TFhirExtension.Destroy;
begin
  FUrl.free;
  FValue.free;
  inherited;
end;

procedure TFhirExtension.Assign(oSource : TAdvObject);
begin
  inherited;
  urlElement := TFhirExtension(oSource).urlElement.Clone;
  value := TFhirExtension(oSource).value.Clone;
end;

procedure TFhirExtension.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'url') Then
     list.add(FUrl.Link);
  if (child_name = 'value[x]') Then
     list.add(FValue.Link);
end;

procedure TFhirExtension.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'url', 'uri', FUrl.Link));{2}
  oList.add(TFHIRProperty.create(self, 'value[x]', '*', FValue.Link));{2}
end;

procedure TFhirExtension.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'url') then UrlElement := propValue as TFhirUri{5a}
  else if (propName.startsWith('value')) then Value := propValue as TFhirType{4}
  else inherited;
end;

function TFhirExtension.FhirType : string;
begin
  result := 'Extension';
end;

function TFhirExtension.Link : TFhirExtension;
begin
  result := TFhirExtension(inherited Link);
end;

function TFhirExtension.Clone : TFhirExtension;
begin
  result := TFhirExtension(inherited Clone);
end;

{ TFhirExtension }

Procedure TFhirExtension.SetUrl(value : TFhirUri);
begin
  FUrl.free;
  FUrl := value;
end;

Function TFhirExtension.GetUrlST : String;
begin
  if FUrl = nil then
    result := ''
  else
    result := FUrl.value;
end;

Procedure TFhirExtension.SetUrlST(value : String);
begin
  if value <> '' then
  begin
    if FUrl = nil then
      FUrl := TFhirUri.create;
    FUrl.value := value
  end
  else if FUrl <> nil then
    FUrl.value := '';
end;

Procedure TFhirExtension.SetValue(value : TFhirType);
begin
  FValue.free;
  FValue := value;
end;


{ TFhirExtensionListEnumerator }

Constructor TFhirExtensionListEnumerator.Create(list : TFhirExtensionList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirExtensionListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirExtensionListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirExtensionListEnumerator.GetCurrent : TFhirExtension;
begin
  Result := FList[FIndex];
end;


{ TFhirExtensionList }
procedure TFhirExtensionList.AddItem(value: TFhirExtension);
begin
  assert(value.ClassName = 'TFhirExtension', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirExtension');
  add(value);
end;


function TFhirExtensionList.Append: TFhirExtension;
begin
  result := TFhirExtension.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirExtensionList.ClearItems;
begin
  Clear;
end;

function TFhirExtensionList.GetEnumerator : TFhirExtensionListEnumerator;
begin
  result := TFhirExtensionListEnumerator.Create(self.link);
end;

function TFhirExtensionList.Clone: TFhirExtensionList;
begin
  result := TFhirExtensionList(inherited Clone);
end;

function TFhirExtensionList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirExtensionList.GetItemN(index: Integer): TFhirExtension;
begin
  result := TFhirExtension(ObjectByIndex[index]);
end;

function TFhirExtensionList.IndexOf(value: TFhirExtension): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirExtensionList.Insert(index: Integer): TFhirExtension;
begin
  result := TFhirExtension.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirExtensionList.InsertItem(index: Integer; value: TFhirExtension);
begin
  assert(value is TFhirExtension);
  Inherited Insert(index, value);
end;

function TFhirExtensionList.Item(index: Integer): TFhirExtension;
begin
  result := TFhirExtension(ObjectByIndex[index]);
end;

function TFhirExtensionList.Link: TFhirExtensionList;
begin
  result := TFhirExtensionList(inherited Link);
end;

procedure TFhirExtensionList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirExtensionList.SetItemByIndex(index: Integer; value: TFhirExtension);
begin
  assert(value is TFhirExtension);
  FhirExtensions[index] := value;
end;

procedure TFhirExtensionList.SetItemN(index: Integer; value: TFhirExtension);
begin
  assert(value is TFhirExtension);
  ObjectByIndex[index] := value;
end;

function TFhirNarrativeStatusListAsInteger(aSet : TFhirNarrativeStatusList) : Integer;
var
  a : TFhirNarrativeStatus;
begin
  result := 0;
  for a := low(TFhirNarrativeStatus) to high(TFhirNarrativeStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirNarrativeStatusList(i : Integer) : TFhirNarrativeStatusList;
var
  aLoop : TFhirNarrativeStatus;
begin
  result := [];
  for aLoop := low(TFhirNarrativeStatus) to high(TFhirNarrativeStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


{ TFhirNarrative }

constructor TFhirNarrative.Create;
begin
  inherited;
end;

destructor TFhirNarrative.Destroy;
begin
  FStatus.free;
  FDiv_.free;
  inherited;
end;

procedure TFhirNarrative.Assign(oSource : TAdvObject);
begin
  inherited;
  FStatus := TFhirNarrative(oSource).FStatus.Link;
  div_ := TFhirNarrative(oSource).div_.Clone;
end;

procedure TFhirNarrative.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'status') Then
     list.add(FStatus.Link);
  if (child_name = 'div') Then
     list.add(FDiv_.Link);
end;

procedure TFhirNarrative.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'status', 'code', FStatus.Link));{1}
  oList.add(TFHIRProperty.create(self, 'div', 'xhtml', FDiv_.Link));{2}
end;

procedure TFhirNarrative.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'status') then StatusElement := propValue as TFHIREnum
  else if (propName = 'div') then Div_ := propValue as TFhirXHtmlNode{4b}
  else inherited;
end;

function TFhirNarrative.FhirType : string;
begin
  result := 'Narrative';
end;

function TFhirNarrative.Link : TFhirNarrative;
begin
  result := TFhirNarrative(inherited Link);
end;

function TFhirNarrative.Clone : TFhirNarrative;
begin
  result := TFhirNarrative(inherited Clone);
end;

{ TFhirNarrative }

Procedure TFhirNarrative.SetStatus(value : TFhirEnum);
begin
  FStatus.free;
  FStatus := value;
end;

Function TFhirNarrative.GetStatusST : TFhirNarrativeStatus;
begin
  if FStatus = nil then
    result := TFhirNarrativeStatus(0)
  else
    result := TFhirNarrativeStatus(StringArrayIndexOfSensitive(CODES_TFhirNarrativeStatus, FStatus.value));
end;

Procedure TFhirNarrative.SetStatusST(value : TFhirNarrativeStatus);
begin
  if ord(value) = 0 then
    StatusElement := nil
  else
    StatusElement := TFhirEnum.create(CODES_TFhirNarrativeStatus[value]);
end;

Procedure TFhirNarrative.SetDiv_(value : TFhirXHtmlNode);
begin
  FDiv_.free;
  FDiv_ := value;
end;


{ TFhirNarrativeListEnumerator }

Constructor TFhirNarrativeListEnumerator.Create(list : TFhirNarrativeList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirNarrativeListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirNarrativeListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirNarrativeListEnumerator.GetCurrent : TFhirNarrative;
begin
  Result := FList[FIndex];
end;


{ TFhirNarrativeList }
procedure TFhirNarrativeList.AddItem(value: TFhirNarrative);
begin
  assert(value.ClassName = 'TFhirNarrative', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirNarrative');
  add(value);
end;


function TFhirNarrativeList.Append: TFhirNarrative;
begin
  result := TFhirNarrative.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirNarrativeList.ClearItems;
begin
  Clear;
end;

function TFhirNarrativeList.GetEnumerator : TFhirNarrativeListEnumerator;
begin
  result := TFhirNarrativeListEnumerator.Create(self.link);
end;

function TFhirNarrativeList.Clone: TFhirNarrativeList;
begin
  result := TFhirNarrativeList(inherited Clone);
end;

function TFhirNarrativeList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirNarrativeList.GetItemN(index: Integer): TFhirNarrative;
begin
  result := TFhirNarrative(ObjectByIndex[index]);
end;

function TFhirNarrativeList.IndexOf(value: TFhirNarrative): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirNarrativeList.Insert(index: Integer): TFhirNarrative;
begin
  result := TFhirNarrative.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirNarrativeList.InsertItem(index: Integer; value: TFhirNarrative);
begin
  assert(value is TFhirNarrative);
  Inherited Insert(index, value);
end;

function TFhirNarrativeList.Item(index: Integer): TFhirNarrative;
begin
  result := TFhirNarrative(ObjectByIndex[index]);
end;

function TFhirNarrativeList.Link: TFhirNarrativeList;
begin
  result := TFhirNarrativeList(inherited Link);
end;

procedure TFhirNarrativeList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirNarrativeList.SetItemByIndex(index: Integer; value: TFhirNarrative);
begin
  assert(value is TFhirNarrative);
  FhirNarratives[index] := value;
end;

procedure TFhirNarrativeList.SetItemN(index: Integer; value: TFhirNarrative);
begin
  assert(value is TFhirNarrative);
  ObjectByIndex[index] := value;
end;

{ TFhirPeriod }

constructor TFhirPeriod.Create;
begin
  inherited;
end;

destructor TFhirPeriod.Destroy;
begin
  FStart.free;
  FEnd_.free;
  inherited;
end;

procedure TFhirPeriod.Assign(oSource : TAdvObject);
begin
  inherited;
  startElement := TFhirPeriod(oSource).startElement.Clone;
  end_Element := TFhirPeriod(oSource).end_Element.Clone;
end;

procedure TFhirPeriod.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'start') Then
     list.add(FStart.Link);
  if (child_name = 'end') Then
     list.add(FEnd_.Link);
end;

procedure TFhirPeriod.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'start', 'dateTime', FStart.Link));{2}
  oList.add(TFHIRProperty.create(self, 'end', 'dateTime', FEnd_.Link));{2}
end;

procedure TFhirPeriod.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'start') then StartElement := propValue as TFhirDateTime{5a}
  else if (propName = 'end') then End_Element := propValue as TFhirDateTime{5a}
  else inherited;
end;

function TFhirPeriod.FhirType : string;
begin
  result := 'Period';
end;

function TFhirPeriod.Link : TFhirPeriod;
begin
  result := TFhirPeriod(inherited Link);
end;

function TFhirPeriod.Clone : TFhirPeriod;
begin
  result := TFhirPeriod(inherited Clone);
end;

{ TFhirPeriod }

Procedure TFhirPeriod.SetStart(value : TFhirDateTime);
begin
  FStart.free;
  FStart := value;
end;

Function TFhirPeriod.GetStartST : TDateAndTime;
begin
  if FStart = nil then
    result := nil
  else
    result := FStart.value;
end;

Procedure TFhirPeriod.SetStartST(value : TDateAndTime);
begin
  if value <> nil then
  begin
    if FStart = nil then
      FStart := TFhirDateTime.create;
    FStart.value := value
  end
  else if FStart <> nil then
    FStart.value := nil;
end;

Procedure TFhirPeriod.SetEnd_(value : TFhirDateTime);
begin
  FEnd_.free;
  FEnd_ := value;
end;

Function TFhirPeriod.GetEnd_ST : TDateAndTime;
begin
  if FEnd_ = nil then
    result := nil
  else
    result := FEnd_.value;
end;

Procedure TFhirPeriod.SetEnd_ST(value : TDateAndTime);
begin
  if value <> nil then
  begin
    if FEnd_ = nil then
      FEnd_ := TFhirDateTime.create;
    FEnd_.value := value
  end
  else if FEnd_ <> nil then
    FEnd_.value := nil;
end;


{ TFhirPeriodListEnumerator }

Constructor TFhirPeriodListEnumerator.Create(list : TFhirPeriodList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirPeriodListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirPeriodListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirPeriodListEnumerator.GetCurrent : TFhirPeriod;
begin
  Result := FList[FIndex];
end;


{ TFhirPeriodList }
procedure TFhirPeriodList.AddItem(value: TFhirPeriod);
begin
  assert(value.ClassName = 'TFhirPeriod', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirPeriod');
  add(value);
end;


function TFhirPeriodList.Append: TFhirPeriod;
begin
  result := TFhirPeriod.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirPeriodList.ClearItems;
begin
  Clear;
end;

function TFhirPeriodList.GetEnumerator : TFhirPeriodListEnumerator;
begin
  result := TFhirPeriodListEnumerator.Create(self.link);
end;

function TFhirPeriodList.Clone: TFhirPeriodList;
begin
  result := TFhirPeriodList(inherited Clone);
end;

function TFhirPeriodList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirPeriodList.GetItemN(index: Integer): TFhirPeriod;
begin
  result := TFhirPeriod(ObjectByIndex[index]);
end;

function TFhirPeriodList.IndexOf(value: TFhirPeriod): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirPeriodList.Insert(index: Integer): TFhirPeriod;
begin
  result := TFhirPeriod.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirPeriodList.InsertItem(index: Integer; value: TFhirPeriod);
begin
  assert(value is TFhirPeriod);
  Inherited Insert(index, value);
end;

function TFhirPeriodList.Item(index: Integer): TFhirPeriod;
begin
  result := TFhirPeriod(ObjectByIndex[index]);
end;

function TFhirPeriodList.Link: TFhirPeriodList;
begin
  result := TFhirPeriodList(inherited Link);
end;

procedure TFhirPeriodList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirPeriodList.SetItemByIndex(index: Integer; value: TFhirPeriod);
begin
  assert(value is TFhirPeriod);
  FhirPeriods[index] := value;
end;

procedure TFhirPeriodList.SetItemN(index: Integer; value: TFhirPeriod);
begin
  assert(value is TFhirPeriod);
  ObjectByIndex[index] := value;
end;

{ TFhirCoding }

constructor TFhirCoding.Create;
begin
  inherited;
end;

destructor TFhirCoding.Destroy;
begin
  FSystem.free;
  FVersion.free;
  FCode.free;
  FDisplay.free;
  FPrimary.free;
  FValueSet.free;
  inherited;
end;

procedure TFhirCoding.Assign(oSource : TAdvObject);
begin
  inherited;
  systemElement := TFhirCoding(oSource).systemElement.Clone;
  versionElement := TFhirCoding(oSource).versionElement.Clone;
  codeElement := TFhirCoding(oSource).codeElement.Clone;
  displayElement := TFhirCoding(oSource).displayElement.Clone;
  primaryElement := TFhirCoding(oSource).primaryElement.Clone;
  valueSet := TFhirCoding(oSource).valueSet.Clone;
end;

procedure TFhirCoding.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'system') Then
     list.add(FSystem.Link);
  if (child_name = 'version') Then
     list.add(FVersion.Link);
  if (child_name = 'code') Then
     list.add(FCode.Link);
  if (child_name = 'display') Then
     list.add(FDisplay.Link);
  if (child_name = 'primary') Then
     list.add(FPrimary.Link);
  if (child_name = 'valueSet') Then
     list.add(FValueSet.Link);
end;

procedure TFhirCoding.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'system', 'uri', FSystem.Link));{2}
  oList.add(TFHIRProperty.create(self, 'version', 'string', FVersion.Link));{2}
  oList.add(TFHIRProperty.create(self, 'code', 'code', FCode.Link));{2}
  oList.add(TFHIRProperty.create(self, 'display', 'string', FDisplay.Link));{2}
  oList.add(TFHIRProperty.create(self, 'primary', 'boolean', FPrimary.Link));{2}
  oList.add(TFHIRProperty.create(self, 'valueSet', 'Reference(ValueSet)', FValueSet.Link));{2}
end;

procedure TFhirCoding.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'system') then SystemElement := propValue as TFhirUri{5a}
  else if (propName = 'version') then VersionElement := propValue as TFhirString{5a}
  else if (propName = 'code') then
    if propValue is TFHIRCode then
      CodeElement := propValue as TFhirCode{5}
    else if propValue is TFHIREnum then
      CodeElement := TFHIRCode.create(TFHIREnum(propValue).value)
    else
      raise Exception.Create('Type mismatch: cannot convert from "'+propValue.className+'" to "TFHIRCode"'){5a}
  else if (propName = 'display') then DisplayElement := propValue as TFhirString{5a}
  else if (propName = 'primary') then PrimaryElement := propValue as TFhirBoolean{5a}
  else if (propName = 'valueSet') then ValueSet := propValue as TFhirReference{TFhirValueSet}{4b}
  else inherited;
end;

function TFhirCoding.FhirType : string;
begin
  result := 'Coding';
end;

function TFhirCoding.Link : TFhirCoding;
begin
  result := TFhirCoding(inherited Link);
end;

function TFhirCoding.Clone : TFhirCoding;
begin
  result := TFhirCoding(inherited Clone);
end;

{ TFhirCoding }

Procedure TFhirCoding.SetSystem(value : TFhirUri);
begin
  FSystem.free;
  FSystem := value;
end;

Function TFhirCoding.GetSystemST : String;
begin
  if FSystem = nil then
    result := ''
  else
    result := FSystem.value;
end;

Procedure TFhirCoding.SetSystemST(value : String);
begin
  if value <> '' then
  begin
    if FSystem = nil then
      FSystem := TFhirUri.create;
    FSystem.value := value
  end
  else if FSystem <> nil then
    FSystem.value := '';
end;

Procedure TFhirCoding.SetVersion(value : TFhirString);
begin
  FVersion.free;
  FVersion := value;
end;

Function TFhirCoding.GetVersionST : String;
begin
  if FVersion = nil then
    result := ''
  else
    result := FVersion.value;
end;

Procedure TFhirCoding.SetVersionST(value : String);
begin
  if value <> '' then
  begin
    if FVersion = nil then
      FVersion := TFhirString.create;
    FVersion.value := value
  end
  else if FVersion <> nil then
    FVersion.value := '';
end;

Procedure TFhirCoding.SetCode(value : TFhirCode);
begin
  FCode.free;
  FCode := value;
end;

Function TFhirCoding.GetCodeST : String;
begin
  if FCode = nil then
    result := ''
  else
    result := FCode.value;
end;

Procedure TFhirCoding.SetCodeST(value : String);
begin
  if value <> '' then
  begin
    if FCode = nil then
      FCode := TFhirCode.create;
    FCode.value := value
  end
  else if FCode <> nil then
    FCode.value := '';
end;

Procedure TFhirCoding.SetDisplay(value : TFhirString);
begin
  FDisplay.free;
  FDisplay := value;
end;

Function TFhirCoding.GetDisplayST : String;
begin
  if FDisplay = nil then
    result := ''
  else
    result := FDisplay.value;
end;

Procedure TFhirCoding.SetDisplayST(value : String);
begin
  if value <> '' then
  begin
    if FDisplay = nil then
      FDisplay := TFhirString.create;
    FDisplay.value := value
  end
  else if FDisplay <> nil then
    FDisplay.value := '';
end;

Procedure TFhirCoding.SetPrimary(value : TFhirBoolean);
begin
  FPrimary.free;
  FPrimary := value;
end;

Function TFhirCoding.GetPrimaryST : Boolean;
begin
  if FPrimary = nil then
    result := false
  else
    result := FPrimary.value;
end;

Procedure TFhirCoding.SetPrimaryST(value : Boolean);
begin
  if FPrimary = nil then
    FPrimary := TFhirBoolean.create;
  FPrimary.value := value
end;

Procedure TFhirCoding.SetValueSet(value : TFhirReference{TFhirValueSet});
begin
  FValueSet.free;
  FValueSet := value;
end;


{ TFhirCodingListEnumerator }

Constructor TFhirCodingListEnumerator.Create(list : TFhirCodingList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirCodingListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirCodingListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirCodingListEnumerator.GetCurrent : TFhirCoding;
begin
  Result := FList[FIndex];
end;


{ TFhirCodingList }
procedure TFhirCodingList.AddItem(value: TFhirCoding);
begin
  assert(value.ClassName = 'TFhirCoding', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirCoding');
  add(value);
end;


function TFhirCodingList.Append: TFhirCoding;
begin
  result := TFhirCoding.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirCodingList.ClearItems;
begin
  Clear;
end;

function TFhirCodingList.GetEnumerator : TFhirCodingListEnumerator;
begin
  result := TFhirCodingListEnumerator.Create(self.link);
end;

function TFhirCodingList.Clone: TFhirCodingList;
begin
  result := TFhirCodingList(inherited Clone);
end;

function TFhirCodingList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirCodingList.GetItemN(index: Integer): TFhirCoding;
begin
  result := TFhirCoding(ObjectByIndex[index]);
end;

function TFhirCodingList.IndexOf(value: TFhirCoding): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirCodingList.Insert(index: Integer): TFhirCoding;
begin
  result := TFhirCoding.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirCodingList.InsertItem(index: Integer; value: TFhirCoding);
begin
  assert(value is TFhirCoding);
  Inherited Insert(index, value);
end;

function TFhirCodingList.Item(index: Integer): TFhirCoding;
begin
  result := TFhirCoding(ObjectByIndex[index]);
end;

function TFhirCodingList.Link: TFhirCodingList;
begin
  result := TFhirCodingList(inherited Link);
end;

procedure TFhirCodingList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirCodingList.SetItemByIndex(index: Integer; value: TFhirCoding);
begin
  assert(value is TFhirCoding);
  FhirCodings[index] := value;
end;

procedure TFhirCodingList.SetItemN(index: Integer; value: TFhirCoding);
begin
  assert(value is TFhirCoding);
  ObjectByIndex[index] := value;
end;

{ TFhirRange }

constructor TFhirRange.Create;
begin
  inherited;
end;

destructor TFhirRange.Destroy;
begin
  FLow.free;
  FHigh.free;
  inherited;
end;

procedure TFhirRange.Assign(oSource : TAdvObject);
begin
  inherited;
  low := TFhirRange(oSource).low.Clone;
  high := TFhirRange(oSource).high.Clone;
end;

procedure TFhirRange.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'low') Then
     list.add(FLow.Link);
  if (child_name = 'high') Then
     list.add(FHigh.Link);
end;

procedure TFhirRange.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'low', 'Quantity', FLow.Link));{2}
  oList.add(TFHIRProperty.create(self, 'high', 'Quantity', FHigh.Link));{2}
end;

procedure TFhirRange.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'low') then Low := propValue as TFhirQuantity{4b}
  else if (propName = 'high') then High := propValue as TFhirQuantity{4b}
  else inherited;
end;

function TFhirRange.FhirType : string;
begin
  result := 'Range';
end;

function TFhirRange.Link : TFhirRange;
begin
  result := TFhirRange(inherited Link);
end;

function TFhirRange.Clone : TFhirRange;
begin
  result := TFhirRange(inherited Clone);
end;

{ TFhirRange }

Procedure TFhirRange.SetLow(value : TFhirQuantity);
begin
  FLow.free;
  FLow := value;
end;

Procedure TFhirRange.SetHigh(value : TFhirQuantity);
begin
  FHigh.free;
  FHigh := value;
end;


{ TFhirRangeListEnumerator }

Constructor TFhirRangeListEnumerator.Create(list : TFhirRangeList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirRangeListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirRangeListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirRangeListEnumerator.GetCurrent : TFhirRange;
begin
  Result := FList[FIndex];
end;


{ TFhirRangeList }
procedure TFhirRangeList.AddItem(value: TFhirRange);
begin
  assert(value.ClassName = 'TFhirRange', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirRange');
  add(value);
end;


function TFhirRangeList.Append: TFhirRange;
begin
  result := TFhirRange.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirRangeList.ClearItems;
begin
  Clear;
end;

function TFhirRangeList.GetEnumerator : TFhirRangeListEnumerator;
begin
  result := TFhirRangeListEnumerator.Create(self.link);
end;

function TFhirRangeList.Clone: TFhirRangeList;
begin
  result := TFhirRangeList(inherited Clone);
end;

function TFhirRangeList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirRangeList.GetItemN(index: Integer): TFhirRange;
begin
  result := TFhirRange(ObjectByIndex[index]);
end;

function TFhirRangeList.IndexOf(value: TFhirRange): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirRangeList.Insert(index: Integer): TFhirRange;
begin
  result := TFhirRange.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirRangeList.InsertItem(index: Integer; value: TFhirRange);
begin
  assert(value is TFhirRange);
  Inherited Insert(index, value);
end;

function TFhirRangeList.Item(index: Integer): TFhirRange;
begin
  result := TFhirRange(ObjectByIndex[index]);
end;

function TFhirRangeList.Link: TFhirRangeList;
begin
  result := TFhirRangeList(inherited Link);
end;

procedure TFhirRangeList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirRangeList.SetItemByIndex(index: Integer; value: TFhirRange);
begin
  assert(value is TFhirRange);
  FhirRanges[index] := value;
end;

procedure TFhirRangeList.SetItemN(index: Integer; value: TFhirRange);
begin
  assert(value is TFhirRange);
  ObjectByIndex[index] := value;
end;

function TFhirQuantityComparatorListAsInteger(aSet : TFhirQuantityComparatorList) : Integer;
var
  a : TFhirQuantityComparator;
begin
  result := 0;
  for a := low(TFhirQuantityComparator) to high(TFhirQuantityComparator) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirQuantityComparatorList(i : Integer) : TFhirQuantityComparatorList;
var
  aLoop : TFhirQuantityComparator;
begin
  result := [];
  for aLoop := low(TFhirQuantityComparator) to high(TFhirQuantityComparator) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


{ TFhirQuantity }

constructor TFhirQuantity.Create;
begin
  inherited;
end;

destructor TFhirQuantity.Destroy;
begin
  FValue.free;
  FComparator.free;
  FUnits.free;
  FSystem.free;
  FCode.free;
  inherited;
end;

procedure TFhirQuantity.Assign(oSource : TAdvObject);
begin
  inherited;
  valueElement := TFhirQuantity(oSource).valueElement.Clone;
  FComparator := TFhirQuantity(oSource).FComparator.Link;
  unitsElement := TFhirQuantity(oSource).unitsElement.Clone;
  systemElement := TFhirQuantity(oSource).systemElement.Clone;
  codeElement := TFhirQuantity(oSource).codeElement.Clone;
end;

procedure TFhirQuantity.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'value') Then
     list.add(FValue.Link);
  if (child_name = 'comparator') Then
     list.add(FComparator.Link);
  if (child_name = 'units') Then
     list.add(FUnits.Link);
  if (child_name = 'system') Then
     list.add(FSystem.Link);
  if (child_name = 'code') Then
     list.add(FCode.Link);
end;

procedure TFhirQuantity.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'value', 'decimal', FValue.Link));{2}
  oList.add(TFHIRProperty.create(self, 'comparator', 'code', FComparator.Link));{1}
  oList.add(TFHIRProperty.create(self, 'units', 'string', FUnits.Link));{2}
  oList.add(TFHIRProperty.create(self, 'system', 'uri', FSystem.Link));{2}
  oList.add(TFHIRProperty.create(self, 'code', 'code', FCode.Link));{2}
end;

procedure TFhirQuantity.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'value') then ValueElement := propValue as TFhirDecimal{5a}
  else if (propName = 'comparator') then ComparatorElement := propValue as TFHIREnum
  else if (propName = 'units') then UnitsElement := propValue as TFhirString{5a}
  else if (propName = 'system') then SystemElement := propValue as TFhirUri{5a}
  else if (propName = 'code') then
    if propValue is TFHIRCode then
      CodeElement := propValue as TFhirCode{5}
    else if propValue is TFHIREnum then
      CodeElement := TFHIRCode.create(TFHIREnum(propValue).value)
    else
      raise Exception.Create('Type mismatch: cannot convert from "'+propValue.className+'" to "TFHIRCode"'){5a}
  else inherited;
end;

function TFhirQuantity.FhirType : string;
begin
  result := 'Quantity';
end;

function TFhirQuantity.Link : TFhirQuantity;
begin
  result := TFhirQuantity(inherited Link);
end;

function TFhirQuantity.Clone : TFhirQuantity;
begin
  result := TFhirQuantity(inherited Clone);
end;

{ TFhirQuantity }

Procedure TFhirQuantity.SetValue(value : TFhirDecimal);
begin
  FValue.free;
  FValue := value;
end;

Function TFhirQuantity.GetValueST : String;
begin
  if FValue = nil then
    result := ''
  else
    result := FValue.value;
end;

Procedure TFhirQuantity.SetValueST(value : String);
begin
  if value <> '' then
  begin
    if FValue = nil then
      FValue := TFhirDecimal.create;
    FValue.value := value
  end
  else if FValue <> nil then
    FValue.value := '';
end;

Procedure TFhirQuantity.SetComparator(value : TFhirEnum);
begin
  FComparator.free;
  FComparator := value;
end;

Function TFhirQuantity.GetComparatorST : TFhirQuantityComparator;
begin
  if FComparator = nil then
    result := TFhirQuantityComparator(0)
  else
    result := TFhirQuantityComparator(StringArrayIndexOfSensitive(CODES_TFhirQuantityComparator, FComparator.value));
end;

Procedure TFhirQuantity.SetComparatorST(value : TFhirQuantityComparator);
begin
  if ord(value) = 0 then
    ComparatorElement := nil
  else
    ComparatorElement := TFhirEnum.create(CODES_TFhirQuantityComparator[value]);
end;

Procedure TFhirQuantity.SetUnits(value : TFhirString);
begin
  FUnits.free;
  FUnits := value;
end;

Function TFhirQuantity.GetUnitsST : String;
begin
  if FUnits = nil then
    result := ''
  else
    result := FUnits.value;
end;

Procedure TFhirQuantity.SetUnitsST(value : String);
begin
  if value <> '' then
  begin
    if FUnits = nil then
      FUnits := TFhirString.create;
    FUnits.value := value
  end
  else if FUnits <> nil then
    FUnits.value := '';
end;

Procedure TFhirQuantity.SetSystem(value : TFhirUri);
begin
  FSystem.free;
  FSystem := value;
end;

Function TFhirQuantity.GetSystemST : String;
begin
  if FSystem = nil then
    result := ''
  else
    result := FSystem.value;
end;

Procedure TFhirQuantity.SetSystemST(value : String);
begin
  if value <> '' then
  begin
    if FSystem = nil then
      FSystem := TFhirUri.create;
    FSystem.value := value
  end
  else if FSystem <> nil then
    FSystem.value := '';
end;

Procedure TFhirQuantity.SetCode(value : TFhirCode);
begin
  FCode.free;
  FCode := value;
end;

Function TFhirQuantity.GetCodeST : String;
begin
  if FCode = nil then
    result := ''
  else
    result := FCode.value;
end;

Procedure TFhirQuantity.SetCodeST(value : String);
begin
  if value <> '' then
  begin
    if FCode = nil then
      FCode := TFhirCode.create;
    FCode.value := value
  end
  else if FCode <> nil then
    FCode.value := '';
end;


{ TFhirQuantityListEnumerator }

Constructor TFhirQuantityListEnumerator.Create(list : TFhirQuantityList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirQuantityListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirQuantityListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirQuantityListEnumerator.GetCurrent : TFhirQuantity;
begin
  Result := FList[FIndex];
end;


{ TFhirQuantityList }
procedure TFhirQuantityList.AddItem(value: TFhirQuantity);
begin
  assert(value.ClassName = 'TFhirQuantity', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirQuantity');
  add(value);
end;


function TFhirQuantityList.Append: TFhirQuantity;
begin
  result := TFhirQuantity.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirQuantityList.ClearItems;
begin
  Clear;
end;

function TFhirQuantityList.GetEnumerator : TFhirQuantityListEnumerator;
begin
  result := TFhirQuantityListEnumerator.Create(self.link);
end;

function TFhirQuantityList.Clone: TFhirQuantityList;
begin
  result := TFhirQuantityList(inherited Clone);
end;

function TFhirQuantityList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirQuantityList.GetItemN(index: Integer): TFhirQuantity;
begin
  result := TFhirQuantity(ObjectByIndex[index]);
end;

function TFhirQuantityList.IndexOf(value: TFhirQuantity): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirQuantityList.Insert(index: Integer): TFhirQuantity;
begin
  result := TFhirQuantity.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirQuantityList.InsertItem(index: Integer; value: TFhirQuantity);
begin
  assert(value is TFhirQuantity);
  Inherited Insert(index, value);
end;

function TFhirQuantityList.Item(index: Integer): TFhirQuantity;
begin
  result := TFhirQuantity(ObjectByIndex[index]);
end;

function TFhirQuantityList.Link: TFhirQuantityList;
begin
  result := TFhirQuantityList(inherited Link);
end;

procedure TFhirQuantityList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirQuantityList.SetItemByIndex(index: Integer; value: TFhirQuantity);
begin
  assert(value is TFhirQuantity);
  FhirQuantities[index] := value;
end;

procedure TFhirQuantityList.SetItemN(index: Integer; value: TFhirQuantity);
begin
  assert(value is TFhirQuantity);
  ObjectByIndex[index] := value;
end;

{ TFhirAttachment }

constructor TFhirAttachment.Create;
begin
  inherited;
end;

destructor TFhirAttachment.Destroy;
begin
  FContentType.free;
  FLanguage.free;
  FData.free;
  FUrl.free;
  FSize.free;
  FHash.free;
  FTitle.free;
  inherited;
end;

procedure TFhirAttachment.Assign(oSource : TAdvObject);
begin
  inherited;
  contentTypeElement := TFhirAttachment(oSource).contentTypeElement.Clone;
  languageElement := TFhirAttachment(oSource).languageElement.Clone;
  dataElement := TFhirAttachment(oSource).dataElement.Clone;
  urlElement := TFhirAttachment(oSource).urlElement.Clone;
  sizeElement := TFhirAttachment(oSource).sizeElement.Clone;
  hashElement := TFhirAttachment(oSource).hashElement.Clone;
  titleElement := TFhirAttachment(oSource).titleElement.Clone;
end;

procedure TFhirAttachment.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'contentType') Then
     list.add(FContentType.Link);
  if (child_name = 'language') Then
     list.add(FLanguage.Link);
  if (child_name = 'data') Then
     list.add(FData.Link);
  if (child_name = 'url') Then
     list.add(FUrl.Link);
  if (child_name = 'size') Then
     list.add(FSize.Link);
  if (child_name = 'hash') Then
     list.add(FHash.Link);
  if (child_name = 'title') Then
     list.add(FTitle.Link);
end;

procedure TFhirAttachment.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'contentType', 'code', FContentType.Link));{2}
  oList.add(TFHIRProperty.create(self, 'language', 'code', FLanguage.Link));{2}
  oList.add(TFHIRProperty.create(self, 'data', 'base64Binary', FData.Link));{2}
  oList.add(TFHIRProperty.create(self, 'url', 'uri', FUrl.Link));{2}
  oList.add(TFHIRProperty.create(self, 'size', 'integer', FSize.Link));{2}
  oList.add(TFHIRProperty.create(self, 'hash', 'base64Binary', FHash.Link));{2}
  oList.add(TFHIRProperty.create(self, 'title', 'string', FTitle.Link));{2}
end;

procedure TFhirAttachment.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'contentType') then
    if propValue is TFHIRCode then
      ContentTypeElement := propValue as TFhirCode{5}
    else if propValue is TFHIREnum then
      ContentTypeElement := TFHIRCode.create(TFHIREnum(propValue).value)
    else
      raise Exception.Create('Type mismatch: cannot convert from "'+propValue.className+'" to "TFHIRCode"'){5a}
  else if (propName = 'language') then
    if propValue is TFHIRCode then
      LanguageElement := propValue as TFhirCode{5}
    else if propValue is TFHIREnum then
      LanguageElement := TFHIRCode.create(TFHIREnum(propValue).value)
    else
      raise Exception.Create('Type mismatch: cannot convert from "'+propValue.className+'" to "TFHIRCode"'){5a}
  else if (propName = 'data') then DataElement := propValue as TFhirBase64Binary{5a}
  else if (propName = 'url') then UrlElement := propValue as TFhirUri{5a}
  else if (propName = 'size') then SizeElement := propValue as TFhirInteger{5a}
  else if (propName = 'hash') then HashElement := propValue as TFhirBase64Binary{5a}
  else if (propName = 'title') then TitleElement := propValue as TFhirString{5a}
  else inherited;
end;

function TFhirAttachment.FhirType : string;
begin
  result := 'Attachment';
end;

function TFhirAttachment.Link : TFhirAttachment;
begin
  result := TFhirAttachment(inherited Link);
end;

function TFhirAttachment.Clone : TFhirAttachment;
begin
  result := TFhirAttachment(inherited Clone);
end;

{ TFhirAttachment }

Procedure TFhirAttachment.SetContentType(value : TFhirCode);
begin
  FContentType.free;
  FContentType := value;
end;

Function TFhirAttachment.GetContentTypeST : String;
begin
  if FContentType = nil then
    result := ''
  else
    result := FContentType.value;
end;

Procedure TFhirAttachment.SetContentTypeST(value : String);
begin
  if value <> '' then
  begin
    if FContentType = nil then
      FContentType := TFhirCode.create;
    FContentType.value := value
  end
  else if FContentType <> nil then
    FContentType.value := '';
end;

Procedure TFhirAttachment.SetLanguage(value : TFhirCode);
begin
  FLanguage.free;
  FLanguage := value;
end;

Function TFhirAttachment.GetLanguageST : String;
begin
  if FLanguage = nil then
    result := ''
  else
    result := FLanguage.value;
end;

Procedure TFhirAttachment.SetLanguageST(value : String);
begin
  if value <> '' then
  begin
    if FLanguage = nil then
      FLanguage := TFhirCode.create;
    FLanguage.value := value
  end
  else if FLanguage <> nil then
    FLanguage.value := '';
end;

Procedure TFhirAttachment.SetData(value : TFhirBase64Binary);
begin
  FData.free;
  FData := value;
end;

Function TFhirAttachment.GetDataST : TBytes;
begin
  if FData = nil then
    result := nil
  else
    result := FData.value;
end;

Procedure TFhirAttachment.SetDataST(value : TBytes);
begin
  if value <> nil then
  begin
    if FData = nil then
      FData := TFhirBase64Binary.create;
    FData.value := value
  end
  else if FData <> nil then
    FData.value := nil;
end;

Procedure TFhirAttachment.SetUrl(value : TFhirUri);
begin
  FUrl.free;
  FUrl := value;
end;

Function TFhirAttachment.GetUrlST : String;
begin
  if FUrl = nil then
    result := ''
  else
    result := FUrl.value;
end;

Procedure TFhirAttachment.SetUrlST(value : String);
begin
  if value <> '' then
  begin
    if FUrl = nil then
      FUrl := TFhirUri.create;
    FUrl.value := value
  end
  else if FUrl <> nil then
    FUrl.value := '';
end;

Procedure TFhirAttachment.SetSize(value : TFhirInteger);
begin
  FSize.free;
  FSize := value;
end;

Function TFhirAttachment.GetSizeST : String;
begin
  if FSize = nil then
    result := ''
  else
    result := FSize.value;
end;

Procedure TFhirAttachment.SetSizeST(value : String);
begin
  if value <> '' then
  begin
    if FSize = nil then
      FSize := TFhirInteger.create;
    FSize.value := value
  end
  else if FSize <> nil then
    FSize.value := '';
end;

Procedure TFhirAttachment.SetHash(value : TFhirBase64Binary);
begin
  FHash.free;
  FHash := value;
end;

Function TFhirAttachment.GetHashST : TBytes;
begin
  if FHash = nil then
    result := nil
  else
    result := FHash.value;
end;

Procedure TFhirAttachment.SetHashST(value : TBytes);
begin
  if value <> nil then
  begin
    if FHash = nil then
      FHash := TFhirBase64Binary.create;
    FHash.value := value
  end
  else if FHash <> nil then
    FHash.value := nil;
end;

Procedure TFhirAttachment.SetTitle(value : TFhirString);
begin
  FTitle.free;
  FTitle := value;
end;

Function TFhirAttachment.GetTitleST : String;
begin
  if FTitle = nil then
    result := ''
  else
    result := FTitle.value;
end;

Procedure TFhirAttachment.SetTitleST(value : String);
begin
  if value <> '' then
  begin
    if FTitle = nil then
      FTitle := TFhirString.create;
    FTitle.value := value
  end
  else if FTitle <> nil then
    FTitle.value := '';
end;


{ TFhirAttachmentListEnumerator }

Constructor TFhirAttachmentListEnumerator.Create(list : TFhirAttachmentList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirAttachmentListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirAttachmentListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirAttachmentListEnumerator.GetCurrent : TFhirAttachment;
begin
  Result := FList[FIndex];
end;


{ TFhirAttachmentList }
procedure TFhirAttachmentList.AddItem(value: TFhirAttachment);
begin
  assert(value.ClassName = 'TFhirAttachment', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirAttachment');
  add(value);
end;


function TFhirAttachmentList.Append: TFhirAttachment;
begin
  result := TFhirAttachment.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirAttachmentList.ClearItems;
begin
  Clear;
end;

function TFhirAttachmentList.GetEnumerator : TFhirAttachmentListEnumerator;
begin
  result := TFhirAttachmentListEnumerator.Create(self.link);
end;

function TFhirAttachmentList.Clone: TFhirAttachmentList;
begin
  result := TFhirAttachmentList(inherited Clone);
end;

function TFhirAttachmentList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirAttachmentList.GetItemN(index: Integer): TFhirAttachment;
begin
  result := TFhirAttachment(ObjectByIndex[index]);
end;

function TFhirAttachmentList.IndexOf(value: TFhirAttachment): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirAttachmentList.Insert(index: Integer): TFhirAttachment;
begin
  result := TFhirAttachment.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirAttachmentList.InsertItem(index: Integer; value: TFhirAttachment);
begin
  assert(value is TFhirAttachment);
  Inherited Insert(index, value);
end;

function TFhirAttachmentList.Item(index: Integer): TFhirAttachment;
begin
  result := TFhirAttachment(ObjectByIndex[index]);
end;

function TFhirAttachmentList.Link: TFhirAttachmentList;
begin
  result := TFhirAttachmentList(inherited Link);
end;

procedure TFhirAttachmentList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirAttachmentList.SetItemByIndex(index: Integer; value: TFhirAttachment);
begin
  assert(value is TFhirAttachment);
  FhirAttachments[index] := value;
end;

procedure TFhirAttachmentList.SetItemN(index: Integer; value: TFhirAttachment);
begin
  assert(value is TFhirAttachment);
  ObjectByIndex[index] := value;
end;

{ TFhirRatio }

constructor TFhirRatio.Create;
begin
  inherited;
end;

destructor TFhirRatio.Destroy;
begin
  FNumerator.free;
  FDenominator.free;
  inherited;
end;

procedure TFhirRatio.Assign(oSource : TAdvObject);
begin
  inherited;
  numerator := TFhirRatio(oSource).numerator.Clone;
  denominator := TFhirRatio(oSource).denominator.Clone;
end;

procedure TFhirRatio.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'numerator') Then
     list.add(FNumerator.Link);
  if (child_name = 'denominator') Then
     list.add(FDenominator.Link);
end;

procedure TFhirRatio.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'numerator', 'Quantity', FNumerator.Link));{2}
  oList.add(TFHIRProperty.create(self, 'denominator', 'Quantity', FDenominator.Link));{2}
end;

procedure TFhirRatio.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'numerator') then Numerator := propValue as TFhirQuantity{4b}
  else if (propName = 'denominator') then Denominator := propValue as TFhirQuantity{4b}
  else inherited;
end;

function TFhirRatio.FhirType : string;
begin
  result := 'Ratio';
end;

function TFhirRatio.Link : TFhirRatio;
begin
  result := TFhirRatio(inherited Link);
end;

function TFhirRatio.Clone : TFhirRatio;
begin
  result := TFhirRatio(inherited Clone);
end;

{ TFhirRatio }

Procedure TFhirRatio.SetNumerator(value : TFhirQuantity);
begin
  FNumerator.free;
  FNumerator := value;
end;

Procedure TFhirRatio.SetDenominator(value : TFhirQuantity);
begin
  FDenominator.free;
  FDenominator := value;
end;


{ TFhirRatioListEnumerator }

Constructor TFhirRatioListEnumerator.Create(list : TFhirRatioList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirRatioListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirRatioListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirRatioListEnumerator.GetCurrent : TFhirRatio;
begin
  Result := FList[FIndex];
end;


{ TFhirRatioList }
procedure TFhirRatioList.AddItem(value: TFhirRatio);
begin
  assert(value.ClassName = 'TFhirRatio', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirRatio');
  add(value);
end;


function TFhirRatioList.Append: TFhirRatio;
begin
  result := TFhirRatio.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirRatioList.ClearItems;
begin
  Clear;
end;

function TFhirRatioList.GetEnumerator : TFhirRatioListEnumerator;
begin
  result := TFhirRatioListEnumerator.Create(self.link);
end;

function TFhirRatioList.Clone: TFhirRatioList;
begin
  result := TFhirRatioList(inherited Clone);
end;

function TFhirRatioList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirRatioList.GetItemN(index: Integer): TFhirRatio;
begin
  result := TFhirRatio(ObjectByIndex[index]);
end;

function TFhirRatioList.IndexOf(value: TFhirRatio): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirRatioList.Insert(index: Integer): TFhirRatio;
begin
  result := TFhirRatio.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirRatioList.InsertItem(index: Integer; value: TFhirRatio);
begin
  assert(value is TFhirRatio);
  Inherited Insert(index, value);
end;

function TFhirRatioList.Item(index: Integer): TFhirRatio;
begin
  result := TFhirRatio(ObjectByIndex[index]);
end;

function TFhirRatioList.Link: TFhirRatioList;
begin
  result := TFhirRatioList(inherited Link);
end;

procedure TFhirRatioList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirRatioList.SetItemByIndex(index: Integer; value: TFhirRatio);
begin
  assert(value is TFhirRatio);
  FhirRatios[index] := value;
end;

procedure TFhirRatioList.SetItemN(index: Integer; value: TFhirRatio);
begin
  assert(value is TFhirRatio);
  ObjectByIndex[index] := value;
end;

{ TFhirSampledData }

constructor TFhirSampledData.Create;
begin
  inherited;
end;

destructor TFhirSampledData.Destroy;
begin
  FOrigin.free;
  FPeriod.free;
  FFactor.free;
  FLowerLimit.free;
  FUpperLimit.free;
  FDimensions.free;
  FData.free;
  inherited;
end;

procedure TFhirSampledData.Assign(oSource : TAdvObject);
begin
  inherited;
  origin := TFhirSampledData(oSource).origin.Clone;
  periodElement := TFhirSampledData(oSource).periodElement.Clone;
  factorElement := TFhirSampledData(oSource).factorElement.Clone;
  lowerLimitElement := TFhirSampledData(oSource).lowerLimitElement.Clone;
  upperLimitElement := TFhirSampledData(oSource).upperLimitElement.Clone;
  dimensionsElement := TFhirSampledData(oSource).dimensionsElement.Clone;
  dataElement := TFhirSampledData(oSource).dataElement.Clone;
end;

procedure TFhirSampledData.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'origin') Then
     list.add(FOrigin.Link);
  if (child_name = 'period') Then
     list.add(FPeriod.Link);
  if (child_name = 'factor') Then
     list.add(FFactor.Link);
  if (child_name = 'lowerLimit') Then
     list.add(FLowerLimit.Link);
  if (child_name = 'upperLimit') Then
     list.add(FUpperLimit.Link);
  if (child_name = 'dimensions') Then
     list.add(FDimensions.Link);
  if (child_name = 'data') Then
     list.add(FData.Link);
end;

procedure TFhirSampledData.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'origin', 'Quantity', FOrigin.Link));{2}
  oList.add(TFHIRProperty.create(self, 'period', 'decimal', FPeriod.Link));{2}
  oList.add(TFHIRProperty.create(self, 'factor', 'decimal', FFactor.Link));{2}
  oList.add(TFHIRProperty.create(self, 'lowerLimit', 'decimal', FLowerLimit.Link));{2}
  oList.add(TFHIRProperty.create(self, 'upperLimit', 'decimal', FUpperLimit.Link));{2}
  oList.add(TFHIRProperty.create(self, 'dimensions', 'integer', FDimensions.Link));{2}
  oList.add(TFHIRProperty.create(self, 'data', 'string', FData.Link));{2}
end;

procedure TFhirSampledData.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'origin') then Origin := propValue as TFhirQuantity{4b}
  else if (propName = 'period') then PeriodElement := propValue as TFhirDecimal{5a}
  else if (propName = 'factor') then FactorElement := propValue as TFhirDecimal{5a}
  else if (propName = 'lowerLimit') then LowerLimitElement := propValue as TFhirDecimal{5a}
  else if (propName = 'upperLimit') then UpperLimitElement := propValue as TFhirDecimal{5a}
  else if (propName = 'dimensions') then DimensionsElement := propValue as TFhirInteger{5a}
  else if (propName = 'data') then DataElement := propValue as TFhirString{5a}
  else inherited;
end;

function TFhirSampledData.FhirType : string;
begin
  result := 'SampledData';
end;

function TFhirSampledData.Link : TFhirSampledData;
begin
  result := TFhirSampledData(inherited Link);
end;

function TFhirSampledData.Clone : TFhirSampledData;
begin
  result := TFhirSampledData(inherited Clone);
end;

{ TFhirSampledData }

Procedure TFhirSampledData.SetOrigin(value : TFhirQuantity);
begin
  FOrigin.free;
  FOrigin := value;
end;

Procedure TFhirSampledData.SetPeriod(value : TFhirDecimal);
begin
  FPeriod.free;
  FPeriod := value;
end;

Function TFhirSampledData.GetPeriodST : String;
begin
  if FPeriod = nil then
    result := ''
  else
    result := FPeriod.value;
end;

Procedure TFhirSampledData.SetPeriodST(value : String);
begin
  if value <> '' then
  begin
    if FPeriod = nil then
      FPeriod := TFhirDecimal.create;
    FPeriod.value := value
  end
  else if FPeriod <> nil then
    FPeriod.value := '';
end;

Procedure TFhirSampledData.SetFactor(value : TFhirDecimal);
begin
  FFactor.free;
  FFactor := value;
end;

Function TFhirSampledData.GetFactorST : String;
begin
  if FFactor = nil then
    result := ''
  else
    result := FFactor.value;
end;

Procedure TFhirSampledData.SetFactorST(value : String);
begin
  if value <> '' then
  begin
    if FFactor = nil then
      FFactor := TFhirDecimal.create;
    FFactor.value := value
  end
  else if FFactor <> nil then
    FFactor.value := '';
end;

Procedure TFhirSampledData.SetLowerLimit(value : TFhirDecimal);
begin
  FLowerLimit.free;
  FLowerLimit := value;
end;

Function TFhirSampledData.GetLowerLimitST : String;
begin
  if FLowerLimit = nil then
    result := ''
  else
    result := FLowerLimit.value;
end;

Procedure TFhirSampledData.SetLowerLimitST(value : String);
begin
  if value <> '' then
  begin
    if FLowerLimit = nil then
      FLowerLimit := TFhirDecimal.create;
    FLowerLimit.value := value
  end
  else if FLowerLimit <> nil then
    FLowerLimit.value := '';
end;

Procedure TFhirSampledData.SetUpperLimit(value : TFhirDecimal);
begin
  FUpperLimit.free;
  FUpperLimit := value;
end;

Function TFhirSampledData.GetUpperLimitST : String;
begin
  if FUpperLimit = nil then
    result := ''
  else
    result := FUpperLimit.value;
end;

Procedure TFhirSampledData.SetUpperLimitST(value : String);
begin
  if value <> '' then
  begin
    if FUpperLimit = nil then
      FUpperLimit := TFhirDecimal.create;
    FUpperLimit.value := value
  end
  else if FUpperLimit <> nil then
    FUpperLimit.value := '';
end;

Procedure TFhirSampledData.SetDimensions(value : TFhirInteger);
begin
  FDimensions.free;
  FDimensions := value;
end;

Function TFhirSampledData.GetDimensionsST : String;
begin
  if FDimensions = nil then
    result := ''
  else
    result := FDimensions.value;
end;

Procedure TFhirSampledData.SetDimensionsST(value : String);
begin
  if value <> '' then
  begin
    if FDimensions = nil then
      FDimensions := TFhirInteger.create;
    FDimensions.value := value
  end
  else if FDimensions <> nil then
    FDimensions.value := '';
end;

Procedure TFhirSampledData.SetData(value : TFhirString);
begin
  FData.free;
  FData := value;
end;

Function TFhirSampledData.GetDataST : String;
begin
  if FData = nil then
    result := ''
  else
    result := FData.value;
end;

Procedure TFhirSampledData.SetDataST(value : String);
begin
  if value <> '' then
  begin
    if FData = nil then
      FData := TFhirString.create;
    FData.value := value
  end
  else if FData <> nil then
    FData.value := '';
end;


{ TFhirSampledDataListEnumerator }

Constructor TFhirSampledDataListEnumerator.Create(list : TFhirSampledDataList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirSampledDataListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirSampledDataListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirSampledDataListEnumerator.GetCurrent : TFhirSampledData;
begin
  Result := FList[FIndex];
end;


{ TFhirSampledDataList }
procedure TFhirSampledDataList.AddItem(value: TFhirSampledData);
begin
  assert(value.ClassName = 'TFhirSampledData', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirSampledData');
  add(value);
end;


function TFhirSampledDataList.Append: TFhirSampledData;
begin
  result := TFhirSampledData.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirSampledDataList.ClearItems;
begin
  Clear;
end;

function TFhirSampledDataList.GetEnumerator : TFhirSampledDataListEnumerator;
begin
  result := TFhirSampledDataListEnumerator.Create(self.link);
end;

function TFhirSampledDataList.Clone: TFhirSampledDataList;
begin
  result := TFhirSampledDataList(inherited Clone);
end;

function TFhirSampledDataList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirSampledDataList.GetItemN(index: Integer): TFhirSampledData;
begin
  result := TFhirSampledData(ObjectByIndex[index]);
end;

function TFhirSampledDataList.IndexOf(value: TFhirSampledData): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirSampledDataList.Insert(index: Integer): TFhirSampledData;
begin
  result := TFhirSampledData.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirSampledDataList.InsertItem(index: Integer; value: TFhirSampledData);
begin
  assert(value is TFhirSampledData);
  Inherited Insert(index, value);
end;

function TFhirSampledDataList.Item(index: Integer): TFhirSampledData;
begin
  result := TFhirSampledData(ObjectByIndex[index]);
end;

function TFhirSampledDataList.Link: TFhirSampledDataList;
begin
  result := TFhirSampledDataList(inherited Link);
end;

procedure TFhirSampledDataList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirSampledDataList.SetItemByIndex(index: Integer; value: TFhirSampledData);
begin
  assert(value is TFhirSampledData);
  FhirSampledData[index] := value;
end;

procedure TFhirSampledDataList.SetItemN(index: Integer; value: TFhirSampledData);
begin
  assert(value is TFhirSampledData);
  ObjectByIndex[index] := value;
end;

{ TFhirReference }

constructor TFhirReference.Create;
begin
  inherited;
end;

destructor TFhirReference.Destroy;
begin
  FReference.free;
  FDisplay.free;
  inherited;
end;

procedure TFhirReference.Assign(oSource : TAdvObject);
begin
  inherited;
  referenceElement := TFhirReference(oSource).referenceElement.Clone;
  displayElement := TFhirReference(oSource).displayElement.Clone;
end;

procedure TFhirReference.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'reference') Then
     list.add(FReference.Link);
  if (child_name = 'display') Then
     list.add(FDisplay.Link);
end;

procedure TFhirReference.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'reference', 'string', FReference.Link));{2}
  oList.add(TFHIRProperty.create(self, 'display', 'string', FDisplay.Link));{2}
end;

procedure TFhirReference.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'reference') then ReferenceElement := propValue as TFhirString{5a}
  else if (propName = 'display') then DisplayElement := propValue as TFhirString{5a}
  else inherited;
end;

function TFhirReference.FhirType : string;
begin
  result := 'Reference';
end;

function TFhirReference.Link : TFhirReference;
begin
  result := TFhirReference(inherited Link);
end;

function TFhirReference.Clone : TFhirReference;
begin
  result := TFhirReference(inherited Clone);
end;

{ TFhirReference }

Procedure TFhirReference.SetReference(value : TFhirString);
begin
  FReference.free;
  FReference := value;
end;

Function TFhirReference.GetReferenceST : String;
begin
  if FReference = nil then
    result := ''
  else
    result := FReference.value;
end;

Procedure TFhirReference.SetReferenceST(value : String);
begin
  if value <> '' then
  begin
    if FReference = nil then
      FReference := TFhirString.create;
    FReference.value := value
  end
  else if FReference <> nil then
    FReference.value := '';
end;

Procedure TFhirReference.SetDisplay(value : TFhirString);
begin
  FDisplay.free;
  FDisplay := value;
end;

Function TFhirReference.GetDisplayST : String;
begin
  if FDisplay = nil then
    result := ''
  else
    result := FDisplay.value;
end;

Procedure TFhirReference.SetDisplayST(value : String);
begin
  if value <> '' then
  begin
    if FDisplay = nil then
      FDisplay := TFhirString.create;
    FDisplay.value := value
  end
  else if FDisplay <> nil then
    FDisplay.value := '';
end;


{ TFhirReferenceListEnumerator }

Constructor TFhirReferenceListEnumerator.Create(list : TFhirReferenceList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirReferenceListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirReferenceListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirReferenceListEnumerator.GetCurrent : TFhirReference;
begin
  Result := FList[FIndex];
end;


{ TFhirReferenceList }
procedure TFhirReferenceList.AddItem(value: TFhirReference);
begin
  assert(value.ClassName = 'TFhirReference', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirReference');
  add(value);
end;


function TFhirReferenceList.Append: TFhirReference;
begin
  result := TFhirReference.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirReferenceList.ClearItems;
begin
  Clear;
end;

function TFhirReferenceList.GetEnumerator : TFhirReferenceListEnumerator;
begin
  result := TFhirReferenceListEnumerator.Create(self.link);
end;

function TFhirReferenceList.Clone: TFhirReferenceList;
begin
  result := TFhirReferenceList(inherited Clone);
end;

function TFhirReferenceList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirReferenceList.GetItemN(index: Integer): TFhirReference;
begin
  result := TFhirReference(ObjectByIndex[index]);
end;

function TFhirReferenceList.IndexOf(value: TFhirReference): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirReferenceList.Insert(index: Integer): TFhirReference;
begin
  result := TFhirReference.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirReferenceList.InsertItem(index: Integer; value: TFhirReference);
begin
  assert(value is TFhirReference);
  Inherited Insert(index, value);
end;

function TFhirReferenceList.Item(index: Integer): TFhirReference;
begin
  result := TFhirReference(ObjectByIndex[index]);
end;

function TFhirReferenceList.Link: TFhirReferenceList;
begin
  result := TFhirReferenceList(inherited Link);
end;

procedure TFhirReferenceList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirReferenceList.SetItemByIndex(index: Integer; value: TFhirReference);
begin
  assert(value is TFhirReference);
  FhirReferences[index] := value;
end;

procedure TFhirReferenceList.SetItemN(index: Integer; value: TFhirReference);
begin
  assert(value is TFhirReference);
  ObjectByIndex[index] := value;
end;

{ TFhirCodeableConcept }

constructor TFhirCodeableConcept.Create;
begin
  inherited;
end;

destructor TFhirCodeableConcept.Destroy;
begin
  FCodingList.Free;
  FText.free;
  inherited;
end;

procedure TFhirCodeableConcept.Assign(oSource : TAdvObject);
begin
  inherited;
  if (TFhirCodeableConcept(oSource).FCodingList = nil) then
  begin
    FCodingList.free;
    FCodingList := nil;
  end
  else
  begin
    FCodingList := TFhirCodingList.Create;
  FCodingList.Assign(TFhirCodeableConcept(oSource).FCodingList);
  end;
  textElement := TFhirCodeableConcept(oSource).textElement.Clone;
end;

procedure TFhirCodeableConcept.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'coding') Then
    list.addAll(FCodingList);
  if (child_name = 'text') Then
     list.add(FText.Link);
end;

procedure TFhirCodeableConcept.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'coding', 'Coding', FCodingList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'text', 'string', FText.Link));{2}
end;

procedure TFhirCodeableConcept.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'coding') then CodingList.add(propValue as TFhirCoding){2}
  else if (propName = 'text') then TextElement := propValue as TFhirString{5a}
  else inherited;
end;

function TFhirCodeableConcept.FhirType : string;
begin
  result := 'CodeableConcept';
end;

function TFhirCodeableConcept.Link : TFhirCodeableConcept;
begin
  result := TFhirCodeableConcept(inherited Link);
end;

function TFhirCodeableConcept.Clone : TFhirCodeableConcept;
begin
  result := TFhirCodeableConcept(inherited Clone);
end;

{ TFhirCodeableConcept }

Function TFhirCodeableConcept.GetCodingList : TFhirCodingList;
begin
  if FCodingList = nil then
    FCodingList := TFhirCodingList.Create;
  result := FCodingList;
end;

Function TFhirCodeableConcept.GetHasCodingList : boolean;
begin
  result := (FCodingList <> nil) and (FCodingList.count > 0);
end;

Procedure TFhirCodeableConcept.SetText(value : TFhirString);
begin
  FText.free;
  FText := value;
end;

Function TFhirCodeableConcept.GetTextST : String;
begin
  if FText = nil then
    result := ''
  else
    result := FText.value;
end;

Procedure TFhirCodeableConcept.SetTextST(value : String);
begin
  if value <> '' then
  begin
    if FText = nil then
      FText := TFhirString.create;
    FText.value := value
  end
  else if FText <> nil then
    FText.value := '';
end;


{ TFhirCodeableConceptListEnumerator }

Constructor TFhirCodeableConceptListEnumerator.Create(list : TFhirCodeableConceptList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirCodeableConceptListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirCodeableConceptListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirCodeableConceptListEnumerator.GetCurrent : TFhirCodeableConcept;
begin
  Result := FList[FIndex];
end;


{ TFhirCodeableConceptList }
procedure TFhirCodeableConceptList.AddItem(value: TFhirCodeableConcept);
begin
  assert(value.ClassName = 'TFhirCodeableConcept', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirCodeableConcept');
  add(value);
end;


function TFhirCodeableConceptList.Append: TFhirCodeableConcept;
begin
  result := TFhirCodeableConcept.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirCodeableConceptList.ClearItems;
begin
  Clear;
end;

function TFhirCodeableConceptList.GetEnumerator : TFhirCodeableConceptListEnumerator;
begin
  result := TFhirCodeableConceptListEnumerator.Create(self.link);
end;

function TFhirCodeableConceptList.Clone: TFhirCodeableConceptList;
begin
  result := TFhirCodeableConceptList(inherited Clone);
end;

function TFhirCodeableConceptList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirCodeableConceptList.GetItemN(index: Integer): TFhirCodeableConcept;
begin
  result := TFhirCodeableConcept(ObjectByIndex[index]);
end;

function TFhirCodeableConceptList.IndexOf(value: TFhirCodeableConcept): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirCodeableConceptList.Insert(index: Integer): TFhirCodeableConcept;
begin
  result := TFhirCodeableConcept.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirCodeableConceptList.InsertItem(index: Integer; value: TFhirCodeableConcept);
begin
  assert(value is TFhirCodeableConcept);
  Inherited Insert(index, value);
end;

function TFhirCodeableConceptList.Item(index: Integer): TFhirCodeableConcept;
begin
  result := TFhirCodeableConcept(ObjectByIndex[index]);
end;

function TFhirCodeableConceptList.Link: TFhirCodeableConceptList;
begin
  result := TFhirCodeableConceptList(inherited Link);
end;

procedure TFhirCodeableConceptList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirCodeableConceptList.SetItemByIndex(index: Integer; value: TFhirCodeableConcept);
begin
  assert(value is TFhirCodeableConcept);
  FhirCodeableConcepts[index] := value;
end;

procedure TFhirCodeableConceptList.SetItemN(index: Integer; value: TFhirCodeableConcept);
begin
  assert(value is TFhirCodeableConcept);
  ObjectByIndex[index] := value;
end;

function TFhirIdentifierUseListAsInteger(aSet : TFhirIdentifierUseList) : Integer;
var
  a : TFhirIdentifierUse;
begin
  result := 0;
  for a := low(TFhirIdentifierUse) to high(TFhirIdentifierUse) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirIdentifierUseList(i : Integer) : TFhirIdentifierUseList;
var
  aLoop : TFhirIdentifierUse;
begin
  result := [];
  for aLoop := low(TFhirIdentifierUse) to high(TFhirIdentifierUse) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


{ TFhirIdentifier }

constructor TFhirIdentifier.Create;
begin
  inherited;
end;

destructor TFhirIdentifier.Destroy;
begin
  FUse.free;
  FLabel_.free;
  FSystem.free;
  FValue.free;
  FPeriod.free;
  FAssigner.free;
  inherited;
end;

procedure TFhirIdentifier.Assign(oSource : TAdvObject);
begin
  inherited;
  FUse := TFhirIdentifier(oSource).FUse.Link;
  label_Element := TFhirIdentifier(oSource).label_Element.Clone;
  systemElement := TFhirIdentifier(oSource).systemElement.Clone;
  valueElement := TFhirIdentifier(oSource).valueElement.Clone;
  period := TFhirIdentifier(oSource).period.Clone;
  assigner := TFhirIdentifier(oSource).assigner.Clone;
end;

procedure TFhirIdentifier.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'use') Then
     list.add(FUse.Link);
  if (child_name = 'label') Then
     list.add(FLabel_.Link);
  if (child_name = 'system') Then
     list.add(FSystem.Link);
  if (child_name = 'value') Then
     list.add(FValue.Link);
  if (child_name = 'period') Then
     list.add(FPeriod.Link);
  if (child_name = 'assigner') Then
     list.add(FAssigner.Link);
end;

procedure TFhirIdentifier.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'use', 'code', FUse.Link));{1}
  oList.add(TFHIRProperty.create(self, 'label', 'string', FLabel_.Link));{2}
  oList.add(TFHIRProperty.create(self, 'system', 'uri', FSystem.Link));{2}
  oList.add(TFHIRProperty.create(self, 'value', 'string', FValue.Link));{2}
  oList.add(TFHIRProperty.create(self, 'period', 'Period', FPeriod.Link));{2}
  oList.add(TFHIRProperty.create(self, 'assigner', 'Reference(Organization)', FAssigner.Link));{2}
end;

procedure TFhirIdentifier.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'use') then UseElement := propValue as TFHIREnum
  else if (propName = 'label') then Label_Element := propValue as TFhirString{5a}
  else if (propName = 'system') then SystemElement := propValue as TFhirUri{5a}
  else if (propName = 'value') then ValueElement := propValue as TFhirString{5a}
  else if (propName = 'period') then Period := propValue as TFhirPeriod{4b}
  else if (propName = 'assigner') then Assigner := propValue as TFhirReference{TFhirOrganization}{4b}
  else inherited;
end;

function TFhirIdentifier.FhirType : string;
begin
  result := 'Identifier';
end;

function TFhirIdentifier.Link : TFhirIdentifier;
begin
  result := TFhirIdentifier(inherited Link);
end;

function TFhirIdentifier.Clone : TFhirIdentifier;
begin
  result := TFhirIdentifier(inherited Clone);
end;

{ TFhirIdentifier }

Procedure TFhirIdentifier.SetUse(value : TFhirEnum);
begin
  FUse.free;
  FUse := value;
end;

Function TFhirIdentifier.GetUseST : TFhirIdentifierUse;
begin
  if FUse = nil then
    result := TFhirIdentifierUse(0)
  else
    result := TFhirIdentifierUse(StringArrayIndexOfSensitive(CODES_TFhirIdentifierUse, FUse.value));
end;

Procedure TFhirIdentifier.SetUseST(value : TFhirIdentifierUse);
begin
  if ord(value) = 0 then
    UseElement := nil
  else
    UseElement := TFhirEnum.create(CODES_TFhirIdentifierUse[value]);
end;

Procedure TFhirIdentifier.SetLabel_(value : TFhirString);
begin
  FLabel_.free;
  FLabel_ := value;
end;

Function TFhirIdentifier.GetLabel_ST : String;
begin
  if FLabel_ = nil then
    result := ''
  else
    result := FLabel_.value;
end;

Procedure TFhirIdentifier.SetLabel_ST(value : String);
begin
  if value <> '' then
  begin
    if FLabel_ = nil then
      FLabel_ := TFhirString.create;
    FLabel_.value := value
  end
  else if FLabel_ <> nil then
    FLabel_.value := '';
end;

Procedure TFhirIdentifier.SetSystem(value : TFhirUri);
begin
  FSystem.free;
  FSystem := value;
end;

Function TFhirIdentifier.GetSystemST : String;
begin
  if FSystem = nil then
    result := ''
  else
    result := FSystem.value;
end;

Procedure TFhirIdentifier.SetSystemST(value : String);
begin
  if value <> '' then
  begin
    if FSystem = nil then
      FSystem := TFhirUri.create;
    FSystem.value := value
  end
  else if FSystem <> nil then
    FSystem.value := '';
end;

Procedure TFhirIdentifier.SetValue(value : TFhirString);
begin
  FValue.free;
  FValue := value;
end;

Function TFhirIdentifier.GetValueST : String;
begin
  if FValue = nil then
    result := ''
  else
    result := FValue.value;
end;

Procedure TFhirIdentifier.SetValueST(value : String);
begin
  if value <> '' then
  begin
    if FValue = nil then
      FValue := TFhirString.create;
    FValue.value := value
  end
  else if FValue <> nil then
    FValue.value := '';
end;

Procedure TFhirIdentifier.SetPeriod(value : TFhirPeriod);
begin
  FPeriod.free;
  FPeriod := value;
end;

Procedure TFhirIdentifier.SetAssigner(value : TFhirReference{TFhirOrganization});
begin
  FAssigner.free;
  FAssigner := value;
end;


{ TFhirIdentifierListEnumerator }

Constructor TFhirIdentifierListEnumerator.Create(list : TFhirIdentifierList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirIdentifierListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirIdentifierListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirIdentifierListEnumerator.GetCurrent : TFhirIdentifier;
begin
  Result := FList[FIndex];
end;


{ TFhirIdentifierList }
procedure TFhirIdentifierList.AddItem(value: TFhirIdentifier);
begin
  assert(value.ClassName = 'TFhirIdentifier', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirIdentifier');
  add(value);
end;


function TFhirIdentifierList.Append: TFhirIdentifier;
begin
  result := TFhirIdentifier.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirIdentifierList.ClearItems;
begin
  Clear;
end;

function TFhirIdentifierList.GetEnumerator : TFhirIdentifierListEnumerator;
begin
  result := TFhirIdentifierListEnumerator.Create(self.link);
end;

function TFhirIdentifierList.Clone: TFhirIdentifierList;
begin
  result := TFhirIdentifierList(inherited Clone);
end;

function TFhirIdentifierList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirIdentifierList.GetItemN(index: Integer): TFhirIdentifier;
begin
  result := TFhirIdentifier(ObjectByIndex[index]);
end;

function TFhirIdentifierList.IndexOf(value: TFhirIdentifier): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirIdentifierList.Insert(index: Integer): TFhirIdentifier;
begin
  result := TFhirIdentifier.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirIdentifierList.InsertItem(index: Integer; value: TFhirIdentifier);
begin
  assert(value is TFhirIdentifier);
  Inherited Insert(index, value);
end;

function TFhirIdentifierList.Item(index: Integer): TFhirIdentifier;
begin
  result := TFhirIdentifier(ObjectByIndex[index]);
end;

function TFhirIdentifierList.Link: TFhirIdentifierList;
begin
  result := TFhirIdentifierList(inherited Link);
end;

procedure TFhirIdentifierList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirIdentifierList.SetItemByIndex(index: Integer; value: TFhirIdentifier);
begin
  assert(value is TFhirIdentifier);
  FhirIdentifiers[index] := value;
end;

procedure TFhirIdentifierList.SetItemN(index: Integer; value: TFhirIdentifier);
begin
  assert(value is TFhirIdentifier);
  ObjectByIndex[index] := value;
end;

function TFhirPropertyRepresentationListAsInteger(aSet : TFhirPropertyRepresentationList) : Integer;
var
  a : TFhirPropertyRepresentation;
begin
  result := 0;
  for a := low(TFhirPropertyRepresentation) to high(TFhirPropertyRepresentation) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirPropertyRepresentationList(i : Integer) : TFhirPropertyRepresentationList;
var
  aLoop : TFhirPropertyRepresentation;
begin
  result := [];
  for aLoop := low(TFhirPropertyRepresentation) to high(TFhirPropertyRepresentation) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirResourceSlicingRulesListAsInteger(aSet : TFhirResourceSlicingRulesList) : Integer;
var
  a : TFhirResourceSlicingRules;
begin
  result := 0;
  for a := low(TFhirResourceSlicingRules) to high(TFhirResourceSlicingRules) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirResourceSlicingRulesList(i : Integer) : TFhirResourceSlicingRulesList;
var
  aLoop : TFhirResourceSlicingRules;
begin
  result := [];
  for aLoop := low(TFhirResourceSlicingRules) to high(TFhirResourceSlicingRules) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirResourceAggregationModeListAsInteger(aSet : TFhirResourceAggregationModeList) : Integer;
var
  a : TFhirResourceAggregationMode;
begin
  result := 0;
  for a := low(TFhirResourceAggregationMode) to high(TFhirResourceAggregationMode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirResourceAggregationModeList(i : Integer) : TFhirResourceAggregationModeList;
var
  aLoop : TFhirResourceAggregationMode;
begin
  result := [];
  for aLoop := low(TFhirResourceAggregationMode) to high(TFhirResourceAggregationMode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirConstraintSeverityListAsInteger(aSet : TFhirConstraintSeverityList) : Integer;
var
  a : TFhirConstraintSeverity;
begin
  result := 0;
  for a := low(TFhirConstraintSeverity) to high(TFhirConstraintSeverity) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirConstraintSeverityList(i : Integer) : TFhirConstraintSeverityList;
var
  aLoop : TFhirConstraintSeverity;
begin
  result := [];
  for aLoop := low(TFhirConstraintSeverity) to high(TFhirConstraintSeverity) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirBindingConformanceListAsInteger(aSet : TFhirBindingConformanceList) : Integer;
var
  a : TFhirBindingConformance;
begin
  result := 0;
  for a := low(TFhirBindingConformance) to high(TFhirBindingConformance) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirBindingConformanceList(i : Integer) : TFhirBindingConformanceList;
var
  aLoop : TFhirBindingConformance;
begin
  result := [];
  for aLoop := low(TFhirBindingConformance) to high(TFhirBindingConformance) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


{ TFhirElementDefinitionSlicing }

constructor TFhirElementDefinitionSlicing.Create;
begin
  inherited;
end;

destructor TFhirElementDefinitionSlicing.Destroy;
begin
  FDiscriminatorList.Free;
  FDescription.free;
  FOrdered.free;
  FRules.free;
  inherited;
end;

procedure TFhirElementDefinitionSlicing.Assign(oSource : TAdvObject);
begin
  inherited;
  if (TFhirElementDefinitionSlicing(oSource).FDiscriminatorList = nil) then
  begin
    FDiscriminatorList.free;
    FDiscriminatorList := nil;
  end
  else
  begin
    FDiscriminatorList := TFhirStringList.Create;
  FDiscriminatorList.Assign(TFhirElementDefinitionSlicing(oSource).FDiscriminatorList);
  end;
  descriptionElement := TFhirElementDefinitionSlicing(oSource).descriptionElement.Clone;
  orderedElement := TFhirElementDefinitionSlicing(oSource).orderedElement.Clone;
  FRules := TFhirElementDefinitionSlicing(oSource).FRules.Link;
end;

procedure TFhirElementDefinitionSlicing.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'discriminator') Then
    list.addAll(FDiscriminatorList);
  if (child_name = 'description') Then
     list.add(FDescription.Link);
  if (child_name = 'ordered') Then
     list.add(FOrdered.Link);
  if (child_name = 'rules') Then
     list.add(FRules.Link);
end;

procedure TFhirElementDefinitionSlicing.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'discriminator', 'string', FDiscriminatorList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'description', 'string', FDescription.Link));{2}
  oList.add(TFHIRProperty.create(self, 'ordered', 'boolean', FOrdered.Link));{2}
  oList.add(TFHIRProperty.create(self, 'rules', 'code', FRules.Link));{1}
end;

procedure TFhirElementDefinitionSlicing.setProperty(propName : string; propValue: TFHIRObject);
begin
  if (propName = 'discriminator') then DiscriminatorList.add(propValue as TFhirString){2}
  else if (propName = 'description') then DescriptionElement := propValue as TFhirString{5a}
  else if (propName = 'ordered') then OrderedElement := propValue as TFhirBoolean{5a}
  else if (propName = 'rules') then RulesElement := propValue as TFHIREnum
  else inherited;
end;

function TFhirElementDefinitionSlicing.FhirType : string;
begin
  result := 'slicing';
end;

function TFhirElementDefinitionSlicing.Link : TFhirElementDefinitionSlicing;
begin
  result := TFhirElementDefinitionSlicing(inherited Link);
end;

function TFhirElementDefinitionSlicing.Clone : TFhirElementDefinitionSlicing;
begin
  result := TFhirElementDefinitionSlicing(inherited Clone);
end;

{ TFhirElementDefinitionSlicing }

Function TFhirElementDefinitionSlicing.GetDiscriminatorList : TFhirStringList;
begin
  if FDiscriminatorList = nil then
    FDiscriminatorList := TFhirStringList.Create;
  result := FDiscriminatorList;
end;

Function TFhirElementDefinitionSlicing.GetHasDiscriminatorList : boolean;
begin
  result := (FDiscriminatorList <> nil) and (FDiscriminatorList.count > 0);
end;

Procedure TFhirElementDefinitionSlicing.SetDescription(value : TFhirString);
begin
  FDescription.free;
  FDescription := value;
end;

Function TFhirElementDefinitionSlicing.GetDescriptionST : String;
begin
  if FDescription = nil then
    result := ''
  else
    result := FDescription.value;
end;

Procedure TFhirElementDefinitionSlicing.SetDescriptionST(value : String);
begin
  if value <> '' then
  begin
    if FDescription = nil then
      FDescription := TFhirString.create;
    FDescription.value := value
  end
  else if FDescription <> nil then
    FDescription.value := '';
end;

Procedure TFhirElementDefinitionSlicing.SetOrdered(value : TFhirBoolean);
begin
  FOrdered.free;
  FOrdered := value;
end;

Function TFhirElementDefinitionSlicing.GetOrderedST : Boolean;
begin
  if FOrdered = nil then
    result := false
  else
    result := FOrdered.value;
end;

Procedure TFhirElementDefinitionSlicing.SetOrderedST(value : Boolean);
begin
  if FOrdered = nil then
    FOrdered := TFhirBoolean.create;
  FOrdered.value := value
end;

Procedure TFhirElementDefinitionSlicing.SetRules(value : TFhirEnum);
begin
  FRules.free;
  FRules := value;
end;

Function TFhirElementDefinitionSlicing.GetRulesST : TFhirResourceSlicingRules;
begin
  if FRules = nil then
    result := TFhirResourceSlicingRules(0)
  else
    result := TFhirResourceSlicingRules(StringArrayIndexOfSensitive(CODES_TFhirResourceSlicingRules, FRules.value));
end;

Procedure TFhirElementDefinitionSlicing.SetRulesST(value : TFhirResourceSlicingRules);
begin
  if ord(value) = 0 then
    RulesElement := nil
  else
    RulesElement := TFhirEnum.create(CODES_TFhirResourceSlicingRules[value]);
end;


{ TFhirElementDefinitionSlicingListEnumerator }

Constructor TFhirElementDefinitionSlicingListEnumerator.Create(list : TFhirElementDefinitionSlicingList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirElementDefinitionSlicingListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirElementDefinitionSlicingListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirElementDefinitionSlicingListEnumerator.GetCurrent : TFhirElementDefinitionSlicing;
begin
  Result := FList[FIndex];
end;


{ TFhirElementDefinitionSlicingList }
procedure TFhirElementDefinitionSlicingList.AddItem(value: TFhirElementDefinitionSlicing);
begin
  assert(value.ClassName = 'TFhirElementDefinitionSlicing', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirElementDefinitionSlicing');
  add(value);
end;


function TFhirElementDefinitionSlicingList.Append: TFhirElementDefinitionSlicing;
begin
  result := TFhirElementDefinitionSlicing.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionSlicingList.ClearItems;
begin
  Clear;
end;

function TFhirElementDefinitionSlicingList.GetEnumerator : TFhirElementDefinitionSlicingListEnumerator;
begin
  result := TFhirElementDefinitionSlicingListEnumerator.Create(self.link);
end;

function TFhirElementDefinitionSlicingList.Clone: TFhirElementDefinitionSlicingList;
begin
  result := TFhirElementDefinitionSlicingList(inherited Clone);
end;

function TFhirElementDefinitionSlicingList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirElementDefinitionSlicingList.GetItemN(index: Integer): TFhirElementDefinitionSlicing;
begin
  result := TFhirElementDefinitionSlicing(ObjectByIndex[index]);
end;

function TFhirElementDefinitionSlicingList.IndexOf(value: TFhirElementDefinitionSlicing): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirElementDefinitionSlicingList.Insert(index: Integer): TFhirElementDefinitionSlicing;
begin
  result := TFhirElementDefinitionSlicing.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionSlicingList.InsertItem(index: Integer; value: TFhirElementDefinitionSlicing);
begin
  assert(value is TFhirElementDefinitionSlicing);
  Inherited Insert(index, value);
end;

function TFhirElementDefinitionSlicingList.Item(index: Integer): TFhirElementDefinitionSlicing;
begin
  result := TFhirElementDefinitionSlicing(ObjectByIndex[index]);
end;

function TFhirElementDefinitionSlicingList.Link: TFhirElementDefinitionSlicingList;
begin
  result := TFhirElementDefinitionSlicingList(inherited Link);
end;

procedure TFhirElementDefinitionSlicingList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirElementDefinitionSlicingList.SetItemByIndex(index: Integer; value: TFhirElementDefinitionSlicing);
begin
  assert(value is TFhirElementDefinitionSlicing);
  FhirElementDefinitionSlicings[index] := value;
end;

procedure TFhirElementDefinitionSlicingList.SetItemN(index: Integer; value: TFhirElementDefinitionSlicing);
begin
  assert(value is TFhirElementDefinitionSlicing);
  ObjectByIndex[index] := value;
end;

{ TFhirElementDefinitionType }

constructor TFhirElementDefinitionType.Create;
begin
  inherited;
end;

destructor TFhirElementDefinitionType.Destroy;
begin
  FCode.free;
  FProfile.free;
  FAggregation.Free;
  inherited;
end;

procedure TFhirElementDefinitionType.Assign(oSource : TAdvObject);
begin
  inherited;
  codeElement := TFhirElementDefinitionType(oSource).codeElement.Clone;
  profileElement := TFhirElementDefinitionType(oSource).profileElement.Clone;
  if (TFhirElementDefinitionType(oSource).FAggregation = nil) then
  begin
    FAggregation.free;
    FAggregation := nil;
  end
  else
  begin
    FAggregation := TFHIREnumList.Create;
  FAggregation.Assign(TFhirElementDefinitionType(oSource).FAggregation);
end;
end;

procedure TFhirElementDefinitionType.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'code') Then
     list.add(FCode.Link);
  if (child_name = 'profile') Then
     list.add(FProfile.Link);
  if (child_name = 'aggregation') Then
     list.addAll(FAggregation);
end;

procedure TFhirElementDefinitionType.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'code', 'code', FCode.Link));{2}
  oList.add(TFHIRProperty.create(self, 'profile', 'uri', FProfile.Link));{2}
  oList.add(TFHIRProperty.create(self, 'aggregation', 'code', FAggregation.Link)){3};
end;

procedure TFhirElementDefinitionType.setProperty(propName : string; propValue: TFHIRObject);
begin
  if (propName = 'code') then
    if propValue is TFHIRCode then
      CodeElement := propValue as TFhirCode{5}
    else if propValue is TFHIREnum then
      CodeElement := TFHIRCode.create(TFHIREnum(propValue).value)
    else
      raise Exception.Create('Type mismatch: cannot convert from "'+propValue.className+'" to "TFHIRCode"'){5a}
  else if (propName = 'profile') then ProfileElement := propValue as TFhirUri{5a}
  else if (propName = 'aggregation') then FAggregation.add(propValue as TFHIREnum) {1}
  else inherited;
end;

function TFhirElementDefinitionType.FhirType : string;
begin
  result := 'type';
end;

function TFhirElementDefinitionType.Link : TFhirElementDefinitionType;
begin
  result := TFhirElementDefinitionType(inherited Link);
end;

function TFhirElementDefinitionType.Clone : TFhirElementDefinitionType;
begin
  result := TFhirElementDefinitionType(inherited Clone);
end;

{ TFhirElementDefinitionType }

Procedure TFhirElementDefinitionType.SetCode(value : TFhirCode);
begin
  FCode.free;
  FCode := value;
end;

Function TFhirElementDefinitionType.GetCodeST : String;
begin
  if FCode = nil then
    result := ''
  else
    result := FCode.value;
end;

Procedure TFhirElementDefinitionType.SetCodeST(value : String);
begin
  if value <> '' then
  begin
    if FCode = nil then
      FCode := TFhirCode.create;
    FCode.value := value
  end
  else if FCode <> nil then
    FCode.value := '';
end;

Procedure TFhirElementDefinitionType.SetProfile(value : TFhirUri);
begin
  FProfile.free;
  FProfile := value;
end;

Function TFhirElementDefinitionType.GetProfileST : String;
begin
  if FProfile = nil then
    result := ''
  else
    result := FProfile.value;
end;

Procedure TFhirElementDefinitionType.SetProfileST(value : String);
begin
  if value <> '' then
  begin
    if FProfile = nil then
      FProfile := TFhirUri.create;
    FProfile.value := value
  end
  else if FProfile <> nil then
    FProfile.value := '';
end;

Function TFhirElementDefinitionType.GetAggregation : TFhirEnumList;
begin
  if FAggregation = nil then
    FAggregation := TFHIREnumList.Create;
  result := FAggregation;
end;

Function TFhirElementDefinitionType.GetHasAggregation : boolean;
begin
  result := (FAggregation <> nil) and (FAggregation.count > 0);
end;

Function TFhirElementDefinitionType.GetAggregationST : TFhirResourceAggregationModeList;
  var i : integer;
begin
  result := [];
  for i := 0 to Faggregation.count - 1 do
    result := result + [TFhirResourceAggregationMode(StringArrayIndexOfSensitive(CODES_TFhirResourceAggregationMode, Faggregation[i].value))];
end;

Procedure TFhirElementDefinitionType.SetAggregationST(value : TFhirResourceAggregationModeList);
var a : TFhirResourceAggregationMode;
begin
  Faggregation.clear;
  for a := low(TFhirResourceAggregationMode) to high(TFhirResourceAggregationMode) do
    if a in value then
      Faggregation.add(TFhirEnum.create(CODES_TFhirResourceAggregationMode[a]));
end;


{ TFhirElementDefinitionTypeListEnumerator }

Constructor TFhirElementDefinitionTypeListEnumerator.Create(list : TFhirElementDefinitionTypeList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirElementDefinitionTypeListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirElementDefinitionTypeListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirElementDefinitionTypeListEnumerator.GetCurrent : TFhirElementDefinitionType;
begin
  Result := FList[FIndex];
end;


{ TFhirElementDefinitionTypeList }
procedure TFhirElementDefinitionTypeList.AddItem(value: TFhirElementDefinitionType);
begin
  assert(value.ClassName = 'TFhirElementDefinitionType', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirElementDefinitionType');
  add(value);
end;


function TFhirElementDefinitionTypeList.Append: TFhirElementDefinitionType;
begin
  result := TFhirElementDefinitionType.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionTypeList.ClearItems;
begin
  Clear;
end;

function TFhirElementDefinitionTypeList.GetEnumerator : TFhirElementDefinitionTypeListEnumerator;
begin
  result := TFhirElementDefinitionTypeListEnumerator.Create(self.link);
end;

function TFhirElementDefinitionTypeList.Clone: TFhirElementDefinitionTypeList;
begin
  result := TFhirElementDefinitionTypeList(inherited Clone);
end;

function TFhirElementDefinitionTypeList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirElementDefinitionTypeList.GetItemN(index: Integer): TFhirElementDefinitionType;
begin
  result := TFhirElementDefinitionType(ObjectByIndex[index]);
end;

function TFhirElementDefinitionTypeList.IndexOf(value: TFhirElementDefinitionType): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirElementDefinitionTypeList.Insert(index: Integer): TFhirElementDefinitionType;
begin
  result := TFhirElementDefinitionType.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionTypeList.InsertItem(index: Integer; value: TFhirElementDefinitionType);
begin
  assert(value is TFhirElementDefinitionType);
  Inherited Insert(index, value);
end;

function TFhirElementDefinitionTypeList.Item(index: Integer): TFhirElementDefinitionType;
begin
  result := TFhirElementDefinitionType(ObjectByIndex[index]);
end;

function TFhirElementDefinitionTypeList.Link: TFhirElementDefinitionTypeList;
begin
  result := TFhirElementDefinitionTypeList(inherited Link);
end;

procedure TFhirElementDefinitionTypeList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirElementDefinitionTypeList.SetItemByIndex(index: Integer; value: TFhirElementDefinitionType);
begin
  assert(value is TFhirElementDefinitionType);
  FhirElementDefinitionTypes[index] := value;
end;

procedure TFhirElementDefinitionTypeList.SetItemN(index: Integer; value: TFhirElementDefinitionType);
begin
  assert(value is TFhirElementDefinitionType);
  ObjectByIndex[index] := value;
end;

{ TFhirElementDefinitionConstraint }

constructor TFhirElementDefinitionConstraint.Create;
begin
  inherited;
end;

destructor TFhirElementDefinitionConstraint.Destroy;
begin
  FKey.free;
  FName.free;
  FSeverity.free;
  FHuman.free;
  FXpath.free;
  inherited;
end;

procedure TFhirElementDefinitionConstraint.Assign(oSource : TAdvObject);
begin
  inherited;
  keyElement := TFhirElementDefinitionConstraint(oSource).keyElement.Clone;
  nameElement := TFhirElementDefinitionConstraint(oSource).nameElement.Clone;
  FSeverity := TFhirElementDefinitionConstraint(oSource).FSeverity.Link;
  humanElement := TFhirElementDefinitionConstraint(oSource).humanElement.Clone;
  xpathElement := TFhirElementDefinitionConstraint(oSource).xpathElement.Clone;
end;

procedure TFhirElementDefinitionConstraint.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'key') Then
     list.add(FKey.Link);
  if (child_name = 'name') Then
     list.add(FName.Link);
  if (child_name = 'severity') Then
     list.add(FSeverity.Link);
  if (child_name = 'human') Then
     list.add(FHuman.Link);
  if (child_name = 'xpath') Then
     list.add(FXpath.Link);
end;

procedure TFhirElementDefinitionConstraint.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'key', 'id', FKey.Link));{2}
  oList.add(TFHIRProperty.create(self, 'name', 'string', FName.Link));{2}
  oList.add(TFHIRProperty.create(self, 'severity', 'code', FSeverity.Link));{1}
  oList.add(TFHIRProperty.create(self, 'human', 'string', FHuman.Link));{2}
  oList.add(TFHIRProperty.create(self, 'xpath', 'string', FXpath.Link));{2}
end;

procedure TFhirElementDefinitionConstraint.setProperty(propName : string; propValue: TFHIRObject);
begin
  if (propName = 'key') then KeyElement := propValue as TFhirId{5a}
  else if (propName = 'name') then NameElement := propValue as TFhirString{5a}
  else if (propName = 'severity') then SeverityElement := propValue as TFHIREnum
  else if (propName = 'human') then HumanElement := propValue as TFhirString{5a}
  else if (propName = 'xpath') then XpathElement := propValue as TFhirString{5a}
  else inherited;
end;

function TFhirElementDefinitionConstraint.FhirType : string;
begin
  result := 'constraint';
end;

function TFhirElementDefinitionConstraint.Link : TFhirElementDefinitionConstraint;
begin
  result := TFhirElementDefinitionConstraint(inherited Link);
end;

function TFhirElementDefinitionConstraint.Clone : TFhirElementDefinitionConstraint;
begin
  result := TFhirElementDefinitionConstraint(inherited Clone);
end;

{ TFhirElementDefinitionConstraint }

Procedure TFhirElementDefinitionConstraint.SetKey(value : TFhirId);
begin
  FKey.free;
  FKey := value;
end;

Function TFhirElementDefinitionConstraint.GetKeyST : String;
begin
  if FKey = nil then
    result := ''
  else
    result := FKey.value;
end;

Procedure TFhirElementDefinitionConstraint.SetKeyST(value : String);
begin
  if value <> '' then
  begin
    if FKey = nil then
      FKey := TFhirId.create;
    FKey.value := value
  end
  else if FKey <> nil then
    FKey.value := '';
end;

Procedure TFhirElementDefinitionConstraint.SetName(value : TFhirString);
begin
  FName.free;
  FName := value;
end;

Function TFhirElementDefinitionConstraint.GetNameST : String;
begin
  if FName = nil then
    result := ''
  else
    result := FName.value;
end;

Procedure TFhirElementDefinitionConstraint.SetNameST(value : String);
begin
  if value <> '' then
  begin
    if FName = nil then
      FName := TFhirString.create;
    FName.value := value
  end
  else if FName <> nil then
    FName.value := '';
end;

Procedure TFhirElementDefinitionConstraint.SetSeverity(value : TFhirEnum);
begin
  FSeverity.free;
  FSeverity := value;
end;

Function TFhirElementDefinitionConstraint.GetSeverityST : TFhirConstraintSeverity;
begin
  if FSeverity = nil then
    result := TFhirConstraintSeverity(0)
  else
    result := TFhirConstraintSeverity(StringArrayIndexOfSensitive(CODES_TFhirConstraintSeverity, FSeverity.value));
end;

Procedure TFhirElementDefinitionConstraint.SetSeverityST(value : TFhirConstraintSeverity);
begin
  if ord(value) = 0 then
    SeverityElement := nil
  else
    SeverityElement := TFhirEnum.create(CODES_TFhirConstraintSeverity[value]);
end;

Procedure TFhirElementDefinitionConstraint.SetHuman(value : TFhirString);
begin
  FHuman.free;
  FHuman := value;
end;

Function TFhirElementDefinitionConstraint.GetHumanST : String;
begin
  if FHuman = nil then
    result := ''
  else
    result := FHuman.value;
end;

Procedure TFhirElementDefinitionConstraint.SetHumanST(value : String);
begin
  if value <> '' then
  begin
    if FHuman = nil then
      FHuman := TFhirString.create;
    FHuman.value := value
  end
  else if FHuman <> nil then
    FHuman.value := '';
end;

Procedure TFhirElementDefinitionConstraint.SetXpath(value : TFhirString);
begin
  FXpath.free;
  FXpath := value;
end;

Function TFhirElementDefinitionConstraint.GetXpathST : String;
begin
  if FXpath = nil then
    result := ''
  else
    result := FXpath.value;
end;

Procedure TFhirElementDefinitionConstraint.SetXpathST(value : String);
begin
  if value <> '' then
  begin
    if FXpath = nil then
      FXpath := TFhirString.create;
    FXpath.value := value
  end
  else if FXpath <> nil then
    FXpath.value := '';
end;


{ TFhirElementDefinitionConstraintListEnumerator }

Constructor TFhirElementDefinitionConstraintListEnumerator.Create(list : TFhirElementDefinitionConstraintList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirElementDefinitionConstraintListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirElementDefinitionConstraintListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirElementDefinitionConstraintListEnumerator.GetCurrent : TFhirElementDefinitionConstraint;
begin
  Result := FList[FIndex];
end;


{ TFhirElementDefinitionConstraintList }
procedure TFhirElementDefinitionConstraintList.AddItem(value: TFhirElementDefinitionConstraint);
begin
  assert(value.ClassName = 'TFhirElementDefinitionConstraint', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirElementDefinitionConstraint');
  add(value);
end;


function TFhirElementDefinitionConstraintList.Append: TFhirElementDefinitionConstraint;
begin
  result := TFhirElementDefinitionConstraint.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionConstraintList.ClearItems;
begin
  Clear;
end;

function TFhirElementDefinitionConstraintList.GetEnumerator : TFhirElementDefinitionConstraintListEnumerator;
begin
  result := TFhirElementDefinitionConstraintListEnumerator.Create(self.link);
end;

function TFhirElementDefinitionConstraintList.Clone: TFhirElementDefinitionConstraintList;
begin
  result := TFhirElementDefinitionConstraintList(inherited Clone);
end;

function TFhirElementDefinitionConstraintList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirElementDefinitionConstraintList.GetItemN(index: Integer): TFhirElementDefinitionConstraint;
begin
  result := TFhirElementDefinitionConstraint(ObjectByIndex[index]);
end;

function TFhirElementDefinitionConstraintList.IndexOf(value: TFhirElementDefinitionConstraint): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirElementDefinitionConstraintList.Insert(index: Integer): TFhirElementDefinitionConstraint;
begin
  result := TFhirElementDefinitionConstraint.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionConstraintList.InsertItem(index: Integer; value: TFhirElementDefinitionConstraint);
begin
  assert(value is TFhirElementDefinitionConstraint);
  Inherited Insert(index, value);
end;

function TFhirElementDefinitionConstraintList.Item(index: Integer): TFhirElementDefinitionConstraint;
begin
  result := TFhirElementDefinitionConstraint(ObjectByIndex[index]);
end;

function TFhirElementDefinitionConstraintList.Link: TFhirElementDefinitionConstraintList;
begin
  result := TFhirElementDefinitionConstraintList(inherited Link);
end;

procedure TFhirElementDefinitionConstraintList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirElementDefinitionConstraintList.SetItemByIndex(index: Integer; value: TFhirElementDefinitionConstraint);
begin
  assert(value is TFhirElementDefinitionConstraint);
  FhirElementDefinitionConstraints[index] := value;
end;

procedure TFhirElementDefinitionConstraintList.SetItemN(index: Integer; value: TFhirElementDefinitionConstraint);
begin
  assert(value is TFhirElementDefinitionConstraint);
  ObjectByIndex[index] := value;
end;

{ TFhirElementDefinitionBinding }

constructor TFhirElementDefinitionBinding.Create;
begin
  inherited;
end;

destructor TFhirElementDefinitionBinding.Destroy;
begin
  FName.free;
  FIsExtensible.free;
  FConformance.free;
  FDescription.free;
  FReference.free;
  inherited;
end;

procedure TFhirElementDefinitionBinding.Assign(oSource : TAdvObject);
begin
  inherited;
  nameElement := TFhirElementDefinitionBinding(oSource).nameElement.Clone;
  isExtensibleElement := TFhirElementDefinitionBinding(oSource).isExtensibleElement.Clone;
  FConformance := TFhirElementDefinitionBinding(oSource).FConformance.Link;
  descriptionElement := TFhirElementDefinitionBinding(oSource).descriptionElement.Clone;
  reference := TFhirElementDefinitionBinding(oSource).reference.Clone;
end;

procedure TFhirElementDefinitionBinding.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'name') Then
     list.add(FName.Link);
  if (child_name = 'isExtensible') Then
     list.add(FIsExtensible.Link);
  if (child_name = 'conformance') Then
     list.add(FConformance.Link);
  if (child_name = 'description') Then
     list.add(FDescription.Link);
  if (child_name = 'reference[x]') Then
     list.add(FReference.Link);
end;

procedure TFhirElementDefinitionBinding.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'name', 'string', FName.Link));{2}
  oList.add(TFHIRProperty.create(self, 'isExtensible', 'boolean', FIsExtensible.Link));{2}
  oList.add(TFHIRProperty.create(self, 'conformance', 'code', FConformance.Link));{1}
  oList.add(TFHIRProperty.create(self, 'description', 'string', FDescription.Link));{2}
  oList.add(TFHIRProperty.create(self, 'reference[x]', 'uri|Reference(ValueSet)', FReference.Link));{2}
end;

procedure TFhirElementDefinitionBinding.setProperty(propName : string; propValue: TFHIRObject);
begin
  if (propName = 'name') then NameElement := propValue as TFhirString{5a}
  else if (propName = 'isExtensible') then IsExtensibleElement := propValue as TFhirBoolean{5a}
  else if (propName = 'conformance') then ConformanceElement := propValue as TFHIREnum
  else if (propName = 'description') then DescriptionElement := propValue as TFhirString{5a}
  else if (propName.startsWith('reference')) then Reference := propValue as TFhirType{4}
  else inherited;
end;

function TFhirElementDefinitionBinding.FhirType : string;
begin
  result := 'binding';
end;

function TFhirElementDefinitionBinding.Link : TFhirElementDefinitionBinding;
begin
  result := TFhirElementDefinitionBinding(inherited Link);
end;

function TFhirElementDefinitionBinding.Clone : TFhirElementDefinitionBinding;
begin
  result := TFhirElementDefinitionBinding(inherited Clone);
end;

{ TFhirElementDefinitionBinding }

Procedure TFhirElementDefinitionBinding.SetName(value : TFhirString);
begin
  FName.free;
  FName := value;
end;

Function TFhirElementDefinitionBinding.GetNameST : String;
begin
  if FName = nil then
    result := ''
  else
    result := FName.value;
end;

Procedure TFhirElementDefinitionBinding.SetNameST(value : String);
begin
  if value <> '' then
  begin
    if FName = nil then
      FName := TFhirString.create;
    FName.value := value
  end
  else if FName <> nil then
    FName.value := '';
end;

Procedure TFhirElementDefinitionBinding.SetIsExtensible(value : TFhirBoolean);
begin
  FIsExtensible.free;
  FIsExtensible := value;
end;

Function TFhirElementDefinitionBinding.GetIsExtensibleST : Boolean;
begin
  if FIsExtensible = nil then
    result := false
  else
    result := FIsExtensible.value;
end;

Procedure TFhirElementDefinitionBinding.SetIsExtensibleST(value : Boolean);
begin
  if FIsExtensible = nil then
    FIsExtensible := TFhirBoolean.create;
  FIsExtensible.value := value
end;

Procedure TFhirElementDefinitionBinding.SetConformance(value : TFhirEnum);
begin
  FConformance.free;
  FConformance := value;
end;

Function TFhirElementDefinitionBinding.GetConformanceST : TFhirBindingConformance;
begin
  if FConformance = nil then
    result := TFhirBindingConformance(0)
  else
    result := TFhirBindingConformance(StringArrayIndexOfSensitive(CODES_TFhirBindingConformance, FConformance.value));
end;

Procedure TFhirElementDefinitionBinding.SetConformanceST(value : TFhirBindingConformance);
begin
  if ord(value) = 0 then
    ConformanceElement := nil
  else
    ConformanceElement := TFhirEnum.create(CODES_TFhirBindingConformance[value]);
end;

Procedure TFhirElementDefinitionBinding.SetDescription(value : TFhirString);
begin
  FDescription.free;
  FDescription := value;
end;

Function TFhirElementDefinitionBinding.GetDescriptionST : String;
begin
  if FDescription = nil then
    result := ''
  else
    result := FDescription.value;
end;

Procedure TFhirElementDefinitionBinding.SetDescriptionST(value : String);
begin
  if value <> '' then
  begin
    if FDescription = nil then
      FDescription := TFhirString.create;
    FDescription.value := value
  end
  else if FDescription <> nil then
    FDescription.value := '';
end;

Procedure TFhirElementDefinitionBinding.SetReference(value : TFhirType);
begin
  FReference.free;
  FReference := value;
end;


{ TFhirElementDefinitionBindingListEnumerator }

Constructor TFhirElementDefinitionBindingListEnumerator.Create(list : TFhirElementDefinitionBindingList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirElementDefinitionBindingListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirElementDefinitionBindingListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirElementDefinitionBindingListEnumerator.GetCurrent : TFhirElementDefinitionBinding;
begin
  Result := FList[FIndex];
end;


{ TFhirElementDefinitionBindingList }
procedure TFhirElementDefinitionBindingList.AddItem(value: TFhirElementDefinitionBinding);
begin
  assert(value.ClassName = 'TFhirElementDefinitionBinding', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirElementDefinitionBinding');
  add(value);
end;


function TFhirElementDefinitionBindingList.Append: TFhirElementDefinitionBinding;
begin
  result := TFhirElementDefinitionBinding.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionBindingList.ClearItems;
begin
  Clear;
end;

function TFhirElementDefinitionBindingList.GetEnumerator : TFhirElementDefinitionBindingListEnumerator;
begin
  result := TFhirElementDefinitionBindingListEnumerator.Create(self.link);
end;

function TFhirElementDefinitionBindingList.Clone: TFhirElementDefinitionBindingList;
begin
  result := TFhirElementDefinitionBindingList(inherited Clone);
end;

function TFhirElementDefinitionBindingList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirElementDefinitionBindingList.GetItemN(index: Integer): TFhirElementDefinitionBinding;
begin
  result := TFhirElementDefinitionBinding(ObjectByIndex[index]);
end;

function TFhirElementDefinitionBindingList.IndexOf(value: TFhirElementDefinitionBinding): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirElementDefinitionBindingList.Insert(index: Integer): TFhirElementDefinitionBinding;
begin
  result := TFhirElementDefinitionBinding.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionBindingList.InsertItem(index: Integer; value: TFhirElementDefinitionBinding);
begin
  assert(value is TFhirElementDefinitionBinding);
  Inherited Insert(index, value);
end;

function TFhirElementDefinitionBindingList.Item(index: Integer): TFhirElementDefinitionBinding;
begin
  result := TFhirElementDefinitionBinding(ObjectByIndex[index]);
end;

function TFhirElementDefinitionBindingList.Link: TFhirElementDefinitionBindingList;
begin
  result := TFhirElementDefinitionBindingList(inherited Link);
end;

procedure TFhirElementDefinitionBindingList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirElementDefinitionBindingList.SetItemByIndex(index: Integer; value: TFhirElementDefinitionBinding);
begin
  assert(value is TFhirElementDefinitionBinding);
  FhirElementDefinitionBindings[index] := value;
end;

procedure TFhirElementDefinitionBindingList.SetItemN(index: Integer; value: TFhirElementDefinitionBinding);
begin
  assert(value is TFhirElementDefinitionBinding);
  ObjectByIndex[index] := value;
end;

{ TFhirElementDefinitionMapping }

constructor TFhirElementDefinitionMapping.Create;
begin
  inherited;
end;

destructor TFhirElementDefinitionMapping.Destroy;
begin
  FIdentity.free;
  FMap.free;
  inherited;
end;

procedure TFhirElementDefinitionMapping.Assign(oSource : TAdvObject);
begin
  inherited;
  identityElement := TFhirElementDefinitionMapping(oSource).identityElement.Clone;
  mapElement := TFhirElementDefinitionMapping(oSource).mapElement.Clone;
end;

procedure TFhirElementDefinitionMapping.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'identity') Then
     list.add(FIdentity.Link);
  if (child_name = 'map') Then
     list.add(FMap.Link);
end;

procedure TFhirElementDefinitionMapping.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'identity', 'id', FIdentity.Link));{2}
  oList.add(TFHIRProperty.create(self, 'map', 'string', FMap.Link));{2}
end;

procedure TFhirElementDefinitionMapping.setProperty(propName : string; propValue: TFHIRObject);
begin
  if (propName = 'identity') then IdentityElement := propValue as TFhirId{5a}
  else if (propName = 'map') then MapElement := propValue as TFhirString{5a}
  else inherited;
end;

function TFhirElementDefinitionMapping.FhirType : string;
begin
  result := 'mapping';
end;

function TFhirElementDefinitionMapping.Link : TFhirElementDefinitionMapping;
begin
  result := TFhirElementDefinitionMapping(inherited Link);
end;

function TFhirElementDefinitionMapping.Clone : TFhirElementDefinitionMapping;
begin
  result := TFhirElementDefinitionMapping(inherited Clone);
end;

{ TFhirElementDefinitionMapping }

Procedure TFhirElementDefinitionMapping.SetIdentity(value : TFhirId);
begin
  FIdentity.free;
  FIdentity := value;
end;

Function TFhirElementDefinitionMapping.GetIdentityST : String;
begin
  if FIdentity = nil then
    result := ''
  else
    result := FIdentity.value;
end;

Procedure TFhirElementDefinitionMapping.SetIdentityST(value : String);
begin
  if value <> '' then
  begin
    if FIdentity = nil then
      FIdentity := TFhirId.create;
    FIdentity.value := value
  end
  else if FIdentity <> nil then
    FIdentity.value := '';
end;

Procedure TFhirElementDefinitionMapping.SetMap(value : TFhirString);
begin
  FMap.free;
  FMap := value;
end;

Function TFhirElementDefinitionMapping.GetMapST : String;
begin
  if FMap = nil then
    result := ''
  else
    result := FMap.value;
end;

Procedure TFhirElementDefinitionMapping.SetMapST(value : String);
begin
  if value <> '' then
  begin
    if FMap = nil then
      FMap := TFhirString.create;
    FMap.value := value
  end
  else if FMap <> nil then
    FMap.value := '';
end;


{ TFhirElementDefinitionMappingListEnumerator }

Constructor TFhirElementDefinitionMappingListEnumerator.Create(list : TFhirElementDefinitionMappingList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirElementDefinitionMappingListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirElementDefinitionMappingListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirElementDefinitionMappingListEnumerator.GetCurrent : TFhirElementDefinitionMapping;
begin
  Result := FList[FIndex];
end;


{ TFhirElementDefinitionMappingList }
procedure TFhirElementDefinitionMappingList.AddItem(value: TFhirElementDefinitionMapping);
begin
  assert(value.ClassName = 'TFhirElementDefinitionMapping', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirElementDefinitionMapping');
  add(value);
end;


function TFhirElementDefinitionMappingList.Append: TFhirElementDefinitionMapping;
begin
  result := TFhirElementDefinitionMapping.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionMappingList.ClearItems;
begin
  Clear;
end;

function TFhirElementDefinitionMappingList.GetEnumerator : TFhirElementDefinitionMappingListEnumerator;
begin
  result := TFhirElementDefinitionMappingListEnumerator.Create(self.link);
end;

function TFhirElementDefinitionMappingList.Clone: TFhirElementDefinitionMappingList;
begin
  result := TFhirElementDefinitionMappingList(inherited Clone);
end;

function TFhirElementDefinitionMappingList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirElementDefinitionMappingList.GetItemN(index: Integer): TFhirElementDefinitionMapping;
begin
  result := TFhirElementDefinitionMapping(ObjectByIndex[index]);
end;

function TFhirElementDefinitionMappingList.IndexOf(value: TFhirElementDefinitionMapping): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirElementDefinitionMappingList.Insert(index: Integer): TFhirElementDefinitionMapping;
begin
  result := TFhirElementDefinitionMapping.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionMappingList.InsertItem(index: Integer; value: TFhirElementDefinitionMapping);
begin
  assert(value is TFhirElementDefinitionMapping);
  Inherited Insert(index, value);
end;

function TFhirElementDefinitionMappingList.Item(index: Integer): TFhirElementDefinitionMapping;
begin
  result := TFhirElementDefinitionMapping(ObjectByIndex[index]);
end;

function TFhirElementDefinitionMappingList.Link: TFhirElementDefinitionMappingList;
begin
  result := TFhirElementDefinitionMappingList(inherited Link);
end;

procedure TFhirElementDefinitionMappingList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirElementDefinitionMappingList.SetItemByIndex(index: Integer; value: TFhirElementDefinitionMapping);
begin
  assert(value is TFhirElementDefinitionMapping);
  FhirElementDefinitionMappings[index] := value;
end;

procedure TFhirElementDefinitionMappingList.SetItemN(index: Integer; value: TFhirElementDefinitionMapping);
begin
  assert(value is TFhirElementDefinitionMapping);
  ObjectByIndex[index] := value;
end;

{ TFhirElementDefinition }

constructor TFhirElementDefinition.Create;
begin
  inherited;
end;

destructor TFhirElementDefinition.Destroy;
begin
  FPath.free;
  FRepresentation.Free;
  FName.free;
  FSlicing.free;
  FShort.free;
  FFormal.free;
  FComments.free;
  FRequirements.free;
  FSynonymList.Free;
  FMin.free;
  FMax.free;
  FType_List.Free;
  FNameReference.free;
  FDefaultValue.free;
  FMeaningWhenMissing.free;
  FFixed.free;
  FPattern.free;
  FExample.free;
  FMaxLength.free;
  FConditionList.Free;
  FConstraintList.Free;
  FMustSupport.free;
  FIsModifier.free;
  FIsSummary.free;
  FBinding.free;
  FMappingList.Free;
  inherited;
end;

procedure TFhirElementDefinition.Assign(oSource : TAdvObject);
begin
  inherited;
  pathElement := TFhirElementDefinition(oSource).pathElement.Clone;
  if (TFhirElementDefinition(oSource).FRepresentation = nil) then
  begin
    FRepresentation.free;
    FRepresentation := nil;
  end
  else
  begin
    FRepresentation := TFHIREnumList.Create;
  FRepresentation.Assign(TFhirElementDefinition(oSource).FRepresentation);
  end;
  nameElement := TFhirElementDefinition(oSource).nameElement.Clone;
  slicing := TFhirElementDefinition(oSource).slicing.Clone;
  shortElement := TFhirElementDefinition(oSource).shortElement.Clone;
  formalElement := TFhirElementDefinition(oSource).formalElement.Clone;
  commentsElement := TFhirElementDefinition(oSource).commentsElement.Clone;
  requirementsElement := TFhirElementDefinition(oSource).requirementsElement.Clone;
  if (TFhirElementDefinition(oSource).FSynonymList = nil) then
  begin
    FSynonymList.free;
    FSynonymList := nil;
  end
  else
  begin
    FSynonymList := TFhirStringList.Create;
  FSynonymList.Assign(TFhirElementDefinition(oSource).FSynonymList);
  end;
  minElement := TFhirElementDefinition(oSource).minElement.Clone;
  maxElement := TFhirElementDefinition(oSource).maxElement.Clone;
  if (TFhirElementDefinition(oSource).FType_List = nil) then
  begin
    FType_List.free;
    FType_List := nil;
  end
  else
  begin
    FType_List := TFhirElementDefinitionTypeList.Create;
  FType_List.Assign(TFhirElementDefinition(oSource).FType_List);
  end;
  nameReferenceElement := TFhirElementDefinition(oSource).nameReferenceElement.Clone;
  defaultValue := TFhirElementDefinition(oSource).defaultValue.Clone;
  meaningWhenMissingElement := TFhirElementDefinition(oSource).meaningWhenMissingElement.Clone;
  fixed := TFhirElementDefinition(oSource).fixed.Clone;
  pattern := TFhirElementDefinition(oSource).pattern.Clone;
  example := TFhirElementDefinition(oSource).example.Clone;
  maxLengthElement := TFhirElementDefinition(oSource).maxLengthElement.Clone;
  if (TFhirElementDefinition(oSource).FConditionList = nil) then
  begin
    FConditionList.free;
    FConditionList := nil;
  end
  else
  begin
    FConditionList := TFhirIdList.Create;
  FConditionList.Assign(TFhirElementDefinition(oSource).FConditionList);
  end;
  if (TFhirElementDefinition(oSource).FConstraintList = nil) then
  begin
    FConstraintList.free;
    FConstraintList := nil;
  end
  else
  begin
    FConstraintList := TFhirElementDefinitionConstraintList.Create;
  FConstraintList.Assign(TFhirElementDefinition(oSource).FConstraintList);
  end;
  mustSupportElement := TFhirElementDefinition(oSource).mustSupportElement.Clone;
  isModifierElement := TFhirElementDefinition(oSource).isModifierElement.Clone;
  isSummaryElement := TFhirElementDefinition(oSource).isSummaryElement.Clone;
  binding := TFhirElementDefinition(oSource).binding.Clone;
  if (TFhirElementDefinition(oSource).FMappingList = nil) then
  begin
    FMappingList.free;
    FMappingList := nil;
  end
  else
  begin
    FMappingList := TFhirElementDefinitionMappingList.Create;
  FMappingList.Assign(TFhirElementDefinition(oSource).FMappingList);
end;
end;

procedure TFhirElementDefinition.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'path') Then
     list.add(FPath.Link);
  if (child_name = 'representation') Then
     list.addAll(FRepresentation);
  if (child_name = 'name') Then
     list.add(FName.Link);
  if (child_name = 'slicing') Then
     list.add(FSlicing.Link);
  if (child_name = 'short') Then
     list.add(FShort.Link);
  if (child_name = 'formal') Then
     list.add(FFormal.Link);
  if (child_name = 'comments') Then
     list.add(FComments.Link);
  if (child_name = 'requirements') Then
     list.add(FRequirements.Link);
  if (child_name = 'synonym') Then
    list.addAll(FSynonymList);
  if (child_name = 'min') Then
     list.add(FMin.Link);
  if (child_name = 'max') Then
     list.add(FMax.Link);
  if (child_name = 'type') Then
    list.addAll(FType_List);
  if (child_name = 'nameReference') Then
     list.add(FNameReference.Link);
  if (child_name = 'defaultValue[x]') Then
     list.add(FDefaultValue.Link);
  if (child_name = 'meaningWhenMissing') Then
     list.add(FMeaningWhenMissing.Link);
  if (child_name = 'fixed[x]') Then
     list.add(FFixed.Link);
  if (child_name = 'pattern[x]') Then
     list.add(FPattern.Link);
  if (child_name = 'example[x]') Then
     list.add(FExample.Link);
  if (child_name = 'maxLength') Then
     list.add(FMaxLength.Link);
  if (child_name = 'condition') Then
    list.addAll(FConditionList);
  if (child_name = 'constraint') Then
    list.addAll(FConstraintList);
  if (child_name = 'mustSupport') Then
     list.add(FMustSupport.Link);
  if (child_name = 'isModifier') Then
     list.add(FIsModifier.Link);
  if (child_name = 'isSummary') Then
     list.add(FIsSummary.Link);
  if (child_name = 'binding') Then
     list.add(FBinding.Link);
  if (child_name = 'mapping') Then
    list.addAll(FMappingList);
end;

procedure TFhirElementDefinition.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'path', 'string', FPath.Link));{2}
  oList.add(TFHIRProperty.create(self, 'representation', 'code', FRepresentation.Link)){3};
  oList.add(TFHIRProperty.create(self, 'name', 'string', FName.Link));{2}
  oList.add(TFHIRProperty.create(self, 'slicing', '', FSlicing.Link));{2}
  oList.add(TFHIRProperty.create(self, 'short', 'string', FShort.Link));{2}
  oList.add(TFHIRProperty.create(self, 'formal', 'string', FFormal.Link));{2}
  oList.add(TFHIRProperty.create(self, 'comments', 'string', FComments.Link));{2}
  oList.add(TFHIRProperty.create(self, 'requirements', 'string', FRequirements.Link));{2}
  oList.add(TFHIRProperty.create(self, 'synonym', 'string', FSynonymList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'min', 'integer', FMin.Link));{2}
  oList.add(TFHIRProperty.create(self, 'max', 'string', FMax.Link));{2}
  oList.add(TFHIRProperty.create(self, 'type', '', FType_List.Link)){3};
  oList.add(TFHIRProperty.create(self, 'nameReference', 'string', FNameReference.Link));{2}
  oList.add(TFHIRProperty.create(self, 'defaultValue[x]', '*', FDefaultValue.Link));{2}
  oList.add(TFHIRProperty.create(self, 'meaningWhenMissing', 'string', FMeaningWhenMissing.Link));{2}
  oList.add(TFHIRProperty.create(self, 'fixed[x]', '*', FFixed.Link));{2}
  oList.add(TFHIRProperty.create(self, 'pattern[x]', '*', FPattern.Link));{2}
  oList.add(TFHIRProperty.create(self, 'example[x]', '*', FExample.Link));{2}
  oList.add(TFHIRProperty.create(self, 'maxLength', 'integer', FMaxLength.Link));{2}
  oList.add(TFHIRProperty.create(self, 'condition', 'id', FConditionList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'constraint', '', FConstraintList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'mustSupport', 'boolean', FMustSupport.Link));{2}
  oList.add(TFHIRProperty.create(self, 'isModifier', 'boolean', FIsModifier.Link));{2}
  oList.add(TFHIRProperty.create(self, 'isSummary', 'boolean', FIsSummary.Link));{2}
  oList.add(TFHIRProperty.create(self, 'binding', '', FBinding.Link));{2}
  oList.add(TFHIRProperty.create(self, 'mapping', '', FMappingList.Link)){3};
end;

procedure TFhirElementDefinition.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'path') then PathElement := propValue as TFhirString{5a}
  else if (propName = 'representation') then FRepresentation.add(propValue as TFHIREnum) {1}
  else if (propName = 'name') then NameElement := propValue as TFhirString{5a}
  else if (propName = 'slicing') then Slicing := propValue as TFhirElementDefinitionSlicing{4b}
  else if (propName = 'short') then ShortElement := propValue as TFhirString{5a}
  else if (propName = 'formal') then FormalElement := propValue as TFhirString{5a}
  else if (propName = 'comments') then CommentsElement := propValue as TFhirString{5a}
  else if (propName = 'requirements') then RequirementsElement := propValue as TFhirString{5a}
  else if (propName = 'synonym') then SynonymList.add(propValue as TFhirString){2}
  else if (propName = 'min') then MinElement := propValue as TFhirInteger{5a}
  else if (propName = 'max') then MaxElement := propValue as TFhirString{5a}
  else if (propName = 'type') then Type_List.add(propValue as TFhirElementDefinitionType){2}
  else if (propName = 'nameReference') then NameReferenceElement := propValue as TFhirString{5a}
  else if (propName.startsWith('defaultValue')) then DefaultValue := propValue as TFhirType{4}
  else if (propName = 'meaningWhenMissing') then MeaningWhenMissingElement := propValue as TFhirString{5a}
  else if (propName.startsWith('fixed')) then Fixed := propValue as TFhirType{4}
  else if (propName.startsWith('pattern')) then Pattern := propValue as TFhirType{4}
  else if (propName.startsWith('example')) then Example := propValue as TFhirType{4}
  else if (propName = 'maxLength') then MaxLengthElement := propValue as TFhirInteger{5a}
  else if (propName = 'condition') then ConditionList.add(propValue as TFhirId){2}
  else if (propName = 'constraint') then ConstraintList.add(propValue as TFhirElementDefinitionConstraint){2}
  else if (propName = 'mustSupport') then MustSupportElement := propValue as TFhirBoolean{5a}
  else if (propName = 'isModifier') then IsModifierElement := propValue as TFhirBoolean{5a}
  else if (propName = 'isSummary') then IsSummaryElement := propValue as TFhirBoolean{5a}
  else if (propName = 'binding') then Binding := propValue as TFhirElementDefinitionBinding{4b}
  else if (propName = 'mapping') then MappingList.add(propValue as TFhirElementDefinitionMapping){2}
  else inherited;
end;

function TFhirElementDefinition.FhirType : string;
begin
  result := 'ElementDefinition';
end;

function TFhirElementDefinition.Link : TFhirElementDefinition;
begin
  result := TFhirElementDefinition(inherited Link);
end;

function TFhirElementDefinition.Clone : TFhirElementDefinition;
begin
  result := TFhirElementDefinition(inherited Clone);
end;

{ TFhirElementDefinition }

Procedure TFhirElementDefinition.SetPath(value : TFhirString);
begin
  FPath.free;
  FPath := value;
end;

Function TFhirElementDefinition.GetPathST : String;
begin
  if FPath = nil then
    result := ''
  else
    result := FPath.value;
end;

Procedure TFhirElementDefinition.SetPathST(value : String);
begin
  if value <> '' then
  begin
    if FPath = nil then
      FPath := TFhirString.create;
    FPath.value := value
  end
  else if FPath <> nil then
    FPath.value := '';
end;

Function TFhirElementDefinition.GetRepresentation : TFhirEnumList;
begin
  if FRepresentation = nil then
    FRepresentation := TFHIREnumList.Create;
  result := FRepresentation;
end;

Function TFhirElementDefinition.GetHasRepresentation : boolean;
begin
  result := (FRepresentation <> nil) and (FRepresentation.count > 0);
end;

Function TFhirElementDefinition.GetRepresentationST : TFhirPropertyRepresentationList;
  var i : integer;
begin
  result := [];
  for i := 0 to Frepresentation.count - 1 do
    result := result + [TFhirPropertyRepresentation(StringArrayIndexOfSensitive(CODES_TFhirPropertyRepresentation, Frepresentation[i].value))];
end;

Procedure TFhirElementDefinition.SetRepresentationST(value : TFhirPropertyRepresentationList);
var a : TFhirPropertyRepresentation;
begin
  Frepresentation.clear;
  for a := low(TFhirPropertyRepresentation) to high(TFhirPropertyRepresentation) do
    if a in value then
      Frepresentation.add(TFhirEnum.create(CODES_TFhirPropertyRepresentation[a]));
end;

Procedure TFhirElementDefinition.SetName(value : TFhirString);
begin
  FName.free;
  FName := value;
end;

Function TFhirElementDefinition.GetNameST : String;
begin
  if FName = nil then
    result := ''
  else
    result := FName.value;
end;

Procedure TFhirElementDefinition.SetNameST(value : String);
begin
  if value <> '' then
  begin
    if FName = nil then
      FName := TFhirString.create;
    FName.value := value
  end
  else if FName <> nil then
    FName.value := '';
end;

Procedure TFhirElementDefinition.SetSlicing(value : TFhirElementDefinitionSlicing);
begin
  FSlicing.free;
  FSlicing := value;
end;

Procedure TFhirElementDefinition.SetShort(value : TFhirString);
begin
  FShort.free;
  FShort := value;
end;

Function TFhirElementDefinition.GetShortST : String;
begin
  if FShort = nil then
    result := ''
  else
    result := FShort.value;
end;

Procedure TFhirElementDefinition.SetShortST(value : String);
begin
  if value <> '' then
  begin
    if FShort = nil then
      FShort := TFhirString.create;
    FShort.value := value
  end
  else if FShort <> nil then
    FShort.value := '';
end;

Procedure TFhirElementDefinition.SetFormal(value : TFhirString);
begin
  FFormal.free;
  FFormal := value;
end;

Function TFhirElementDefinition.GetFormalST : String;
begin
  if FFormal = nil then
    result := ''
  else
    result := FFormal.value;
end;

Procedure TFhirElementDefinition.SetFormalST(value : String);
begin
  if value <> '' then
  begin
    if FFormal = nil then
      FFormal := TFhirString.create;
    FFormal.value := value
  end
  else if FFormal <> nil then
    FFormal.value := '';
end;

Procedure TFhirElementDefinition.SetComments(value : TFhirString);
begin
  FComments.free;
  FComments := value;
end;

Function TFhirElementDefinition.GetCommentsST : String;
begin
  if FComments = nil then
    result := ''
  else
    result := FComments.value;
end;

Procedure TFhirElementDefinition.SetCommentsST(value : String);
begin
  if value <> '' then
  begin
    if FComments = nil then
      FComments := TFhirString.create;
    FComments.value := value
  end
  else if FComments <> nil then
    FComments.value := '';
end;

Procedure TFhirElementDefinition.SetRequirements(value : TFhirString);
begin
  FRequirements.free;
  FRequirements := value;
end;

Function TFhirElementDefinition.GetRequirementsST : String;
begin
  if FRequirements = nil then
    result := ''
  else
    result := FRequirements.value;
end;

Procedure TFhirElementDefinition.SetRequirementsST(value : String);
begin
  if value <> '' then
  begin
    if FRequirements = nil then
      FRequirements := TFhirString.create;
    FRequirements.value := value
  end
  else if FRequirements <> nil then
    FRequirements.value := '';
end;

Function TFhirElementDefinition.GetSynonymList : TFhirStringList;
begin
  if FSynonymList = nil then
    FSynonymList := TFhirStringList.Create;
  result := FSynonymList;
end;

Function TFhirElementDefinition.GetHasSynonymList : boolean;
begin
  result := (FSynonymList <> nil) and (FSynonymList.count > 0);
end;

Procedure TFhirElementDefinition.SetMin(value : TFhirInteger);
begin
  FMin.free;
  FMin := value;
end;

Function TFhirElementDefinition.GetMinST : String;
begin
  if FMin = nil then
    result := ''
  else
    result := FMin.value;
end;

Procedure TFhirElementDefinition.SetMinST(value : String);
begin
  if value <> '' then
  begin
    if FMin = nil then
      FMin := TFhirInteger.create;
    FMin.value := value
  end
  else if FMin <> nil then
    FMin.value := '';
end;

Procedure TFhirElementDefinition.SetMax(value : TFhirString);
begin
  FMax.free;
  FMax := value;
end;

Function TFhirElementDefinition.GetMaxST : String;
begin
  if FMax = nil then
    result := ''
  else
    result := FMax.value;
end;

Procedure TFhirElementDefinition.SetMaxST(value : String);
begin
  if value <> '' then
  begin
    if FMax = nil then
      FMax := TFhirString.create;
    FMax.value := value
  end
  else if FMax <> nil then
    FMax.value := '';
end;

Function TFhirElementDefinition.GetType_List : TFhirElementDefinitionTypeList;
begin
  if FType_List = nil then
    FType_List := TFhirElementDefinitionTypeList.Create;
  result := FType_List;
end;

Function TFhirElementDefinition.GetHasType_List : boolean;
begin
  result := (FType_List <> nil) and (FType_List.count > 0);
end;

Procedure TFhirElementDefinition.SetNameReference(value : TFhirString);
begin
  FNameReference.free;
  FNameReference := value;
end;

Function TFhirElementDefinition.GetNameReferenceST : String;
begin
  if FNameReference = nil then
    result := ''
  else
    result := FNameReference.value;
end;

Procedure TFhirElementDefinition.SetNameReferenceST(value : String);
begin
  if value <> '' then
  begin
    if FNameReference = nil then
      FNameReference := TFhirString.create;
    FNameReference.value := value
  end
  else if FNameReference <> nil then
    FNameReference.value := '';
end;

Procedure TFhirElementDefinition.SetDefaultValue(value : TFhirType);
begin
  FDefaultValue.free;
  FDefaultValue := value;
end;

Procedure TFhirElementDefinition.SetMeaningWhenMissing(value : TFhirString);
begin
  FMeaningWhenMissing.free;
  FMeaningWhenMissing := value;
end;

Function TFhirElementDefinition.GetMeaningWhenMissingST : String;
begin
  if FMeaningWhenMissing = nil then
    result := ''
  else
    result := FMeaningWhenMissing.value;
end;

Procedure TFhirElementDefinition.SetMeaningWhenMissingST(value : String);
begin
  if value <> '' then
  begin
    if FMeaningWhenMissing = nil then
      FMeaningWhenMissing := TFhirString.create;
    FMeaningWhenMissing.value := value
  end
  else if FMeaningWhenMissing <> nil then
    FMeaningWhenMissing.value := '';
end;

Procedure TFhirElementDefinition.SetFixed(value : TFhirType);
begin
  FFixed.free;
  FFixed := value;
end;

Procedure TFhirElementDefinition.SetPattern(value : TFhirType);
begin
  FPattern.free;
  FPattern := value;
end;

Procedure TFhirElementDefinition.SetExample(value : TFhirType);
begin
  FExample.free;
  FExample := value;
end;

Procedure TFhirElementDefinition.SetMaxLength(value : TFhirInteger);
begin
  FMaxLength.free;
  FMaxLength := value;
end;

Function TFhirElementDefinition.GetMaxLengthST : String;
begin
  if FMaxLength = nil then
    result := ''
  else
    result := FMaxLength.value;
end;

Procedure TFhirElementDefinition.SetMaxLengthST(value : String);
begin
  if value <> '' then
  begin
    if FMaxLength = nil then
      FMaxLength := TFhirInteger.create;
    FMaxLength.value := value
  end
  else if FMaxLength <> nil then
    FMaxLength.value := '';
end;

Function TFhirElementDefinition.GetConditionList : TFhirIdList;
begin
  if FConditionList = nil then
    FConditionList := TFhirIdList.Create;
  result := FConditionList;
end;

Function TFhirElementDefinition.GetHasConditionList : boolean;
begin
  result := (FConditionList <> nil) and (FConditionList.count > 0);
end;

Function TFhirElementDefinition.GetConstraintList : TFhirElementDefinitionConstraintList;
begin
  if FConstraintList = nil then
    FConstraintList := TFhirElementDefinitionConstraintList.Create;
  result := FConstraintList;
end;

Function TFhirElementDefinition.GetHasConstraintList : boolean;
begin
  result := (FConstraintList <> nil) and (FConstraintList.count > 0);
end;

Procedure TFhirElementDefinition.SetMustSupport(value : TFhirBoolean);
begin
  FMustSupport.free;
  FMustSupport := value;
end;

Function TFhirElementDefinition.GetMustSupportST : Boolean;
begin
  if FMustSupport = nil then
    result := false
  else
    result := FMustSupport.value;
end;

Procedure TFhirElementDefinition.SetMustSupportST(value : Boolean);
begin
  if FMustSupport = nil then
    FMustSupport := TFhirBoolean.create;
  FMustSupport.value := value
end;

Procedure TFhirElementDefinition.SetIsModifier(value : TFhirBoolean);
begin
  FIsModifier.free;
  FIsModifier := value;
end;

Function TFhirElementDefinition.GetIsModifierST : Boolean;
begin
  if FIsModifier = nil then
    result := false
  else
    result := FIsModifier.value;
end;

Procedure TFhirElementDefinition.SetIsModifierST(value : Boolean);
begin
  if FIsModifier = nil then
    FIsModifier := TFhirBoolean.create;
  FIsModifier.value := value
end;

Procedure TFhirElementDefinition.SetIsSummary(value : TFhirBoolean);
begin
  FIsSummary.free;
  FIsSummary := value;
end;

Function TFhirElementDefinition.GetIsSummaryST : Boolean;
begin
  if FIsSummary = nil then
    result := false
  else
    result := FIsSummary.value;
end;

Procedure TFhirElementDefinition.SetIsSummaryST(value : Boolean);
begin
  if FIsSummary = nil then
    FIsSummary := TFhirBoolean.create;
  FIsSummary.value := value
end;

Procedure TFhirElementDefinition.SetBinding(value : TFhirElementDefinitionBinding);
begin
  FBinding.free;
  FBinding := value;
end;

Function TFhirElementDefinition.GetMappingList : TFhirElementDefinitionMappingList;
begin
  if FMappingList = nil then
    FMappingList := TFhirElementDefinitionMappingList.Create;
  result := FMappingList;
end;

Function TFhirElementDefinition.GetHasMappingList : boolean;
begin
  result := (FMappingList <> nil) and (FMappingList.count > 0);
end;


{ TFhirElementDefinitionListEnumerator }

Constructor TFhirElementDefinitionListEnumerator.Create(list : TFhirElementDefinitionList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirElementDefinitionListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirElementDefinitionListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirElementDefinitionListEnumerator.GetCurrent : TFhirElementDefinition;
begin
  Result := FList[FIndex];
end;


{ TFhirElementDefinitionList }
procedure TFhirElementDefinitionList.AddItem(value: TFhirElementDefinition);
begin
  assert(value.ClassName = 'TFhirElementDefinition', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirElementDefinition');
  add(value);
end;


function TFhirElementDefinitionList.Append: TFhirElementDefinition;
begin
  result := TFhirElementDefinition.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionList.ClearItems;
begin
  Clear;
end;

function TFhirElementDefinitionList.GetEnumerator : TFhirElementDefinitionListEnumerator;
begin
  result := TFhirElementDefinitionListEnumerator.Create(self.link);
end;

function TFhirElementDefinitionList.Clone: TFhirElementDefinitionList;
begin
  result := TFhirElementDefinitionList(inherited Clone);
end;

function TFhirElementDefinitionList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirElementDefinitionList.GetItemN(index: Integer): TFhirElementDefinition;
begin
  result := TFhirElementDefinition(ObjectByIndex[index]);
end;

function TFhirElementDefinitionList.IndexOf(value: TFhirElementDefinition): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirElementDefinitionList.Insert(index: Integer): TFhirElementDefinition;
begin
  result := TFhirElementDefinition.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirElementDefinitionList.InsertItem(index: Integer; value: TFhirElementDefinition);
begin
  assert(value is TFhirElementDefinition);
  Inherited Insert(index, value);
end;

function TFhirElementDefinitionList.Item(index: Integer): TFhirElementDefinition;
begin
  result := TFhirElementDefinition(ObjectByIndex[index]);
end;

function TFhirElementDefinitionList.Link: TFhirElementDefinitionList;
begin
  result := TFhirElementDefinitionList(inherited Link);
end;

procedure TFhirElementDefinitionList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirElementDefinitionList.SetItemByIndex(index: Integer; value: TFhirElementDefinition);
begin
  assert(value is TFhirElementDefinition);
  FhirElementDefinitions[index] := value;
end;

procedure TFhirElementDefinitionList.SetItemN(index: Integer; value: TFhirElementDefinition);
begin
  assert(value is TFhirElementDefinition);
  ObjectByIndex[index] := value;
end;

function TFhirEventTimingListAsInteger(aSet : TFhirEventTimingList) : Integer;
var
  a : TFhirEventTiming;
begin
  result := 0;
  for a := low(TFhirEventTiming) to high(TFhirEventTiming) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirEventTimingList(i : Integer) : TFhirEventTimingList;
var
  aLoop : TFhirEventTiming;
begin
  result := [];
  for aLoop := low(TFhirEventTiming) to high(TFhirEventTiming) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirUnitsOfTimeListAsInteger(aSet : TFhirUnitsOfTimeList) : Integer;
var
  a : TFhirUnitsOfTime;
begin
  result := 0;
  for a := low(TFhirUnitsOfTime) to high(TFhirUnitsOfTime) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirUnitsOfTimeList(i : Integer) : TFhirUnitsOfTimeList;
var
  aLoop : TFhirUnitsOfTime;
begin
  result := [];
  for aLoop := low(TFhirUnitsOfTime) to high(TFhirUnitsOfTime) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


{ TFhirTimingRepeat }

constructor TFhirTimingRepeat.Create;
begin
  inherited;
end;

destructor TFhirTimingRepeat.Destroy;
begin
  FFrequency.free;
  FWhen.free;
  FDuration.free;
  FUnits.free;
  FCount.free;
  FEnd_.free;
  inherited;
end;

procedure TFhirTimingRepeat.Assign(oSource : TAdvObject);
begin
  inherited;
  frequencyElement := TFhirTimingRepeat(oSource).frequencyElement.Clone;
  FWhen := TFhirTimingRepeat(oSource).FWhen.Link;
  durationElement := TFhirTimingRepeat(oSource).durationElement.Clone;
  FUnits := TFhirTimingRepeat(oSource).FUnits.Link;
  countElement := TFhirTimingRepeat(oSource).countElement.Clone;
  end_Element := TFhirTimingRepeat(oSource).end_Element.Clone;
end;

procedure TFhirTimingRepeat.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'frequency') Then
     list.add(FFrequency.Link);
  if (child_name = 'when') Then
     list.add(FWhen.Link);
  if (child_name = 'duration') Then
     list.add(FDuration.Link);
  if (child_name = 'units') Then
     list.add(FUnits.Link);
  if (child_name = 'count') Then
     list.add(FCount.Link);
  if (child_name = 'end') Then
     list.add(FEnd_.Link);
end;

procedure TFhirTimingRepeat.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'frequency', 'integer', FFrequency.Link));{2}
  oList.add(TFHIRProperty.create(self, 'when', 'code', FWhen.Link));{1}
  oList.add(TFHIRProperty.create(self, 'duration', 'decimal', FDuration.Link));{2}
  oList.add(TFHIRProperty.create(self, 'units', 'code', FUnits.Link));{1}
  oList.add(TFHIRProperty.create(self, 'count', 'integer', FCount.Link));{2}
  oList.add(TFHIRProperty.create(self, 'end', 'dateTime', FEnd_.Link));{2}
end;

procedure TFhirTimingRepeat.setProperty(propName : string; propValue: TFHIRObject);
begin
  if (propName = 'frequency') then FrequencyElement := propValue as TFhirInteger{5a}
  else if (propName = 'when') then WhenElement := propValue as TFHIREnum
  else if (propName = 'duration') then DurationElement := propValue as TFhirDecimal{5a}
  else if (propName = 'units') then UnitsElement := propValue as TFHIREnum
  else if (propName = 'count') then CountElement := propValue as TFhirInteger{5a}
  else if (propName = 'end') then End_Element := propValue as TFhirDateTime{5a}
  else inherited;
end;

function TFhirTimingRepeat.FhirType : string;
begin
  result := 'repeat';
end;

function TFhirTimingRepeat.Link : TFhirTimingRepeat;
begin
  result := TFhirTimingRepeat(inherited Link);
end;

function TFhirTimingRepeat.Clone : TFhirTimingRepeat;
begin
  result := TFhirTimingRepeat(inherited Clone);
end;

{ TFhirTimingRepeat }

Procedure TFhirTimingRepeat.SetFrequency(value : TFhirInteger);
begin
  FFrequency.free;
  FFrequency := value;
end;

Function TFhirTimingRepeat.GetFrequencyST : String;
begin
  if FFrequency = nil then
    result := ''
  else
    result := FFrequency.value;
end;

Procedure TFhirTimingRepeat.SetFrequencyST(value : String);
begin
  if value <> '' then
  begin
    if FFrequency = nil then
      FFrequency := TFhirInteger.create;
    FFrequency.value := value
  end
  else if FFrequency <> nil then
    FFrequency.value := '';
end;

Procedure TFhirTimingRepeat.SetWhen(value : TFhirEnum);
begin
  FWhen.free;
  FWhen := value;
end;

Function TFhirTimingRepeat.GetWhenST : TFhirEventTiming;
begin
  if FWhen = nil then
    result := TFhirEventTiming(0)
  else
    result := TFhirEventTiming(StringArrayIndexOfSensitive(CODES_TFhirEventTiming, FWhen.value));
end;

Procedure TFhirTimingRepeat.SetWhenST(value : TFhirEventTiming);
begin
  if ord(value) = 0 then
    WhenElement := nil
  else
    WhenElement := TFhirEnum.create(CODES_TFhirEventTiming[value]);
end;

Procedure TFhirTimingRepeat.SetDuration(value : TFhirDecimal);
begin
  FDuration.free;
  FDuration := value;
end;

Function TFhirTimingRepeat.GetDurationST : String;
begin
  if FDuration = nil then
    result := ''
  else
    result := FDuration.value;
end;

Procedure TFhirTimingRepeat.SetDurationST(value : String);
begin
  if value <> '' then
  begin
    if FDuration = nil then
      FDuration := TFhirDecimal.create;
    FDuration.value := value
  end
  else if FDuration <> nil then
    FDuration.value := '';
end;

Procedure TFhirTimingRepeat.SetUnits(value : TFhirEnum);
begin
  FUnits.free;
  FUnits := value;
end;

Function TFhirTimingRepeat.GetUnitsST : TFhirUnitsOfTime;
begin
  if FUnits = nil then
    result := TFhirUnitsOfTime(0)
  else
    result := TFhirUnitsOfTime(StringArrayIndexOfSensitive(CODES_TFhirUnitsOfTime, FUnits.value));
end;

Procedure TFhirTimingRepeat.SetUnitsST(value : TFhirUnitsOfTime);
begin
  if ord(value) = 0 then
    UnitsElement := nil
  else
    UnitsElement := TFhirEnum.create(CODES_TFhirUnitsOfTime[value]);
end;

Procedure TFhirTimingRepeat.SetCount(value : TFhirInteger);
begin
  FCount.free;
  FCount := value;
end;

Function TFhirTimingRepeat.GetCountST : String;
begin
  if FCount = nil then
    result := ''
  else
    result := FCount.value;
end;

Procedure TFhirTimingRepeat.SetCountST(value : String);
begin
  if value <> '' then
  begin
    if FCount = nil then
      FCount := TFhirInteger.create;
    FCount.value := value
  end
  else if FCount <> nil then
    FCount.value := '';
end;

Procedure TFhirTimingRepeat.SetEnd_(value : TFhirDateTime);
begin
  FEnd_.free;
  FEnd_ := value;
end;

Function TFhirTimingRepeat.GetEnd_ST : TDateAndTime;
begin
  if FEnd_ = nil then
    result := nil
  else
    result := FEnd_.value;
end;

Procedure TFhirTimingRepeat.SetEnd_ST(value : TDateAndTime);
begin
  if value <> nil then
  begin
    if FEnd_ = nil then
      FEnd_ := TFhirDateTime.create;
    FEnd_.value := value
  end
  else if FEnd_ <> nil then
    FEnd_.value := nil;
end;


{ TFhirTimingRepeatListEnumerator }

Constructor TFhirTimingRepeatListEnumerator.Create(list : TFhirTimingRepeatList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirTimingRepeatListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirTimingRepeatListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirTimingRepeatListEnumerator.GetCurrent : TFhirTimingRepeat;
begin
  Result := FList[FIndex];
end;


{ TFhirTimingRepeatList }
procedure TFhirTimingRepeatList.AddItem(value: TFhirTimingRepeat);
begin
  assert(value.ClassName = 'TFhirTimingRepeat', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirTimingRepeat');
  add(value);
end;


function TFhirTimingRepeatList.Append: TFhirTimingRepeat;
begin
  result := TFhirTimingRepeat.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirTimingRepeatList.ClearItems;
begin
  Clear;
end;

function TFhirTimingRepeatList.GetEnumerator : TFhirTimingRepeatListEnumerator;
begin
  result := TFhirTimingRepeatListEnumerator.Create(self.link);
end;

function TFhirTimingRepeatList.Clone: TFhirTimingRepeatList;
begin
  result := TFhirTimingRepeatList(inherited Clone);
end;

function TFhirTimingRepeatList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirTimingRepeatList.GetItemN(index: Integer): TFhirTimingRepeat;
begin
  result := TFhirTimingRepeat(ObjectByIndex[index]);
end;

function TFhirTimingRepeatList.IndexOf(value: TFhirTimingRepeat): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirTimingRepeatList.Insert(index: Integer): TFhirTimingRepeat;
begin
  result := TFhirTimingRepeat.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirTimingRepeatList.InsertItem(index: Integer; value: TFhirTimingRepeat);
begin
  assert(value is TFhirTimingRepeat);
  Inherited Insert(index, value);
end;

function TFhirTimingRepeatList.Item(index: Integer): TFhirTimingRepeat;
begin
  result := TFhirTimingRepeat(ObjectByIndex[index]);
end;

function TFhirTimingRepeatList.Link: TFhirTimingRepeatList;
begin
  result := TFhirTimingRepeatList(inherited Link);
end;

procedure TFhirTimingRepeatList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirTimingRepeatList.SetItemByIndex(index: Integer; value: TFhirTimingRepeat);
begin
  assert(value is TFhirTimingRepeat);
  FhirTimingRepeats[index] := value;
end;

procedure TFhirTimingRepeatList.SetItemN(index: Integer; value: TFhirTimingRepeat);
begin
  assert(value is TFhirTimingRepeat);
  ObjectByIndex[index] := value;
end;

{ TFhirTiming }

constructor TFhirTiming.Create;
begin
  inherited;
end;

destructor TFhirTiming.Destroy;
begin
  FEventList.Free;
  FRepeat_.free;
  inherited;
end;

procedure TFhirTiming.Assign(oSource : TAdvObject);
begin
  inherited;
  if (TFhirTiming(oSource).FEventList = nil) then
  begin
    FEventList.free;
    FEventList := nil;
  end
  else
  begin
    FEventList := TFhirPeriodList.Create;
  FEventList.Assign(TFhirTiming(oSource).FEventList);
  end;
  repeat_ := TFhirTiming(oSource).repeat_.Clone;
end;

procedure TFhirTiming.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'event') Then
    list.addAll(FEventList);
  if (child_name = 'repeat') Then
     list.add(FRepeat_.Link);
end;

procedure TFhirTiming.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'event', 'Period', FEventList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'repeat', '', FRepeat_.Link));{2}
end;

procedure TFhirTiming.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'event') then EventList.add(propValue as TFhirPeriod){2}
  else if (propName = 'repeat') then Repeat_ := propValue as TFhirTimingRepeat{4b}
  else inherited;
end;

function TFhirTiming.FhirType : string;
begin
  result := 'Timing';
end;

function TFhirTiming.Link : TFhirTiming;
begin
  result := TFhirTiming(inherited Link);
end;

function TFhirTiming.Clone : TFhirTiming;
begin
  result := TFhirTiming(inherited Clone);
end;

{ TFhirTiming }

Function TFhirTiming.GetEventList : TFhirPeriodList;
begin
  if FEventList = nil then
    FEventList := TFhirPeriodList.Create;
  result := FEventList;
end;

Function TFhirTiming.GetHasEventList : boolean;
begin
  result := (FEventList <> nil) and (FEventList.count > 0);
end;

Procedure TFhirTiming.SetRepeat_(value : TFhirTimingRepeat);
begin
  FRepeat_.free;
  FRepeat_ := value;
end;


{ TFhirTimingListEnumerator }

Constructor TFhirTimingListEnumerator.Create(list : TFhirTimingList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirTimingListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirTimingListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirTimingListEnumerator.GetCurrent : TFhirTiming;
begin
  Result := FList[FIndex];
end;


{ TFhirTimingList }
procedure TFhirTimingList.AddItem(value: TFhirTiming);
begin
  assert(value.ClassName = 'TFhirTiming', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirTiming');
  add(value);
end;


function TFhirTimingList.Append: TFhirTiming;
begin
  result := TFhirTiming.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirTimingList.ClearItems;
begin
  Clear;
end;

function TFhirTimingList.GetEnumerator : TFhirTimingListEnumerator;
begin
  result := TFhirTimingListEnumerator.Create(self.link);
end;

function TFhirTimingList.Clone: TFhirTimingList;
begin
  result := TFhirTimingList(inherited Clone);
end;

function TFhirTimingList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirTimingList.GetItemN(index: Integer): TFhirTiming;
begin
  result := TFhirTiming(ObjectByIndex[index]);
end;

function TFhirTimingList.IndexOf(value: TFhirTiming): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirTimingList.Insert(index: Integer): TFhirTiming;
begin
  result := TFhirTiming.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirTimingList.InsertItem(index: Integer; value: TFhirTiming);
begin
  assert(value is TFhirTiming);
  Inherited Insert(index, value);
end;

function TFhirTimingList.Item(index: Integer): TFhirTiming;
begin
  result := TFhirTiming(ObjectByIndex[index]);
end;

function TFhirTimingList.Link: TFhirTimingList;
begin
  result := TFhirTimingList(inherited Link);
end;

procedure TFhirTimingList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirTimingList.SetItemByIndex(index: Integer; value: TFhirTiming);
begin
  assert(value is TFhirTiming);
  FhirTimings[index] := value;
end;

procedure TFhirTimingList.SetItemN(index: Integer; value: TFhirTiming);
begin
  assert(value is TFhirTiming);
  ObjectByIndex[index] := value;
end;

function TFhirAddressUseListAsInteger(aSet : TFhirAddressUseList) : Integer;
var
  a : TFhirAddressUse;
begin
  result := 0;
  for a := low(TFhirAddressUse) to high(TFhirAddressUse) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAddressUseList(i : Integer) : TFhirAddressUseList;
var
  aLoop : TFhirAddressUse;
begin
  result := [];
  for aLoop := low(TFhirAddressUse) to high(TFhirAddressUse) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


{ TFhirAddress }

constructor TFhirAddress.Create;
begin
  inherited;
end;

destructor TFhirAddress.Destroy;
begin
  FUse.free;
  FText.free;
  FLineList.Free;
  FCity.free;
  FState.free;
  FPostalCode.free;
  FCountry.free;
  FPeriod.free;
  inherited;
end;

procedure TFhirAddress.Assign(oSource : TAdvObject);
begin
  inherited;
  FUse := TFhirAddress(oSource).FUse.Link;
  textElement := TFhirAddress(oSource).textElement.Clone;
  if (TFhirAddress(oSource).FLineList = nil) then
  begin
    FLineList.free;
    FLineList := nil;
  end
  else
  begin
    FLineList := TFhirStringList.Create;
  FLineList.Assign(TFhirAddress(oSource).FLineList);
  end;
  cityElement := TFhirAddress(oSource).cityElement.Clone;
  stateElement := TFhirAddress(oSource).stateElement.Clone;
  postalCodeElement := TFhirAddress(oSource).postalCodeElement.Clone;
  countryElement := TFhirAddress(oSource).countryElement.Clone;
  period := TFhirAddress(oSource).period.Clone;
end;

procedure TFhirAddress.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'use') Then
     list.add(FUse.Link);
  if (child_name = 'text') Then
     list.add(FText.Link);
  if (child_name = 'line') Then
    list.addAll(FLineList);
  if (child_name = 'city') Then
     list.add(FCity.Link);
  if (child_name = 'state') Then
     list.add(FState.Link);
  if (child_name = 'postalCode') Then
     list.add(FPostalCode.Link);
  if (child_name = 'country') Then
     list.add(FCountry.Link);
  if (child_name = 'period') Then
     list.add(FPeriod.Link);
end;

procedure TFhirAddress.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'use', 'code', FUse.Link));{1}
  oList.add(TFHIRProperty.create(self, 'text', 'string', FText.Link));{2}
  oList.add(TFHIRProperty.create(self, 'line', 'string', FLineList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'city', 'string', FCity.Link));{2}
  oList.add(TFHIRProperty.create(self, 'state', 'string', FState.Link));{2}
  oList.add(TFHIRProperty.create(self, 'postalCode', 'string', FPostalCode.Link));{2}
  oList.add(TFHIRProperty.create(self, 'country', 'string', FCountry.Link));{2}
  oList.add(TFHIRProperty.create(self, 'period', 'Period', FPeriod.Link));{2}
end;

procedure TFhirAddress.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'use') then UseElement := propValue as TFHIREnum
  else if (propName = 'text') then TextElement := propValue as TFhirString{5a}
  else if (propName = 'line') then LineList.add(propValue as TFhirString){2}
  else if (propName = 'city') then CityElement := propValue as TFhirString{5a}
  else if (propName = 'state') then StateElement := propValue as TFhirString{5a}
  else if (propName = 'postalCode') then PostalCodeElement := propValue as TFhirString{5a}
  else if (propName = 'country') then CountryElement := propValue as TFhirString{5a}
  else if (propName = 'period') then Period := propValue as TFhirPeriod{4b}
  else inherited;
end;

function TFhirAddress.FhirType : string;
begin
  result := 'Address';
end;

function TFhirAddress.Link : TFhirAddress;
begin
  result := TFhirAddress(inherited Link);
end;

function TFhirAddress.Clone : TFhirAddress;
begin
  result := TFhirAddress(inherited Clone);
end;

{ TFhirAddress }

Procedure TFhirAddress.SetUse(value : TFhirEnum);
begin
  FUse.free;
  FUse := value;
end;

Function TFhirAddress.GetUseST : TFhirAddressUse;
begin
  if FUse = nil then
    result := TFhirAddressUse(0)
  else
    result := TFhirAddressUse(StringArrayIndexOfSensitive(CODES_TFhirAddressUse, FUse.value));
end;

Procedure TFhirAddress.SetUseST(value : TFhirAddressUse);
begin
  if ord(value) = 0 then
    UseElement := nil
  else
    UseElement := TFhirEnum.create(CODES_TFhirAddressUse[value]);
end;

Procedure TFhirAddress.SetText(value : TFhirString);
begin
  FText.free;
  FText := value;
end;

Function TFhirAddress.GetTextST : String;
begin
  if FText = nil then
    result := ''
  else
    result := FText.value;
end;

Procedure TFhirAddress.SetTextST(value : String);
begin
  if value <> '' then
  begin
    if FText = nil then
      FText := TFhirString.create;
    FText.value := value
  end
  else if FText <> nil then
    FText.value := '';
end;

Function TFhirAddress.GetLineList : TFhirStringList;
begin
  if FLineList = nil then
    FLineList := TFhirStringList.Create;
  result := FLineList;
end;

Function TFhirAddress.GetHasLineList : boolean;
begin
  result := (FLineList <> nil) and (FLineList.count > 0);
end;

Procedure TFhirAddress.SetCity(value : TFhirString);
begin
  FCity.free;
  FCity := value;
end;

Function TFhirAddress.GetCityST : String;
begin
  if FCity = nil then
    result := ''
  else
    result := FCity.value;
end;

Procedure TFhirAddress.SetCityST(value : String);
begin
  if value <> '' then
  begin
    if FCity = nil then
      FCity := TFhirString.create;
    FCity.value := value
  end
  else if FCity <> nil then
    FCity.value := '';
end;

Procedure TFhirAddress.SetState(value : TFhirString);
begin
  FState.free;
  FState := value;
end;

Function TFhirAddress.GetStateST : String;
begin
  if FState = nil then
    result := ''
  else
    result := FState.value;
end;

Procedure TFhirAddress.SetStateST(value : String);
begin
  if value <> '' then
  begin
    if FState = nil then
      FState := TFhirString.create;
    FState.value := value
  end
  else if FState <> nil then
    FState.value := '';
end;

Procedure TFhirAddress.SetPostalCode(value : TFhirString);
begin
  FPostalCode.free;
  FPostalCode := value;
end;

Function TFhirAddress.GetPostalCodeST : String;
begin
  if FPostalCode = nil then
    result := ''
  else
    result := FPostalCode.value;
end;

Procedure TFhirAddress.SetPostalCodeST(value : String);
begin
  if value <> '' then
  begin
    if FPostalCode = nil then
      FPostalCode := TFhirString.create;
    FPostalCode.value := value
  end
  else if FPostalCode <> nil then
    FPostalCode.value := '';
end;

Procedure TFhirAddress.SetCountry(value : TFhirString);
begin
  FCountry.free;
  FCountry := value;
end;

Function TFhirAddress.GetCountryST : String;
begin
  if FCountry = nil then
    result := ''
  else
    result := FCountry.value;
end;

Procedure TFhirAddress.SetCountryST(value : String);
begin
  if value <> '' then
  begin
    if FCountry = nil then
      FCountry := TFhirString.create;
    FCountry.value := value
  end
  else if FCountry <> nil then
    FCountry.value := '';
end;

Procedure TFhirAddress.SetPeriod(value : TFhirPeriod);
begin
  FPeriod.free;
  FPeriod := value;
end;


{ TFhirAddressListEnumerator }

Constructor TFhirAddressListEnumerator.Create(list : TFhirAddressList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirAddressListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirAddressListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirAddressListEnumerator.GetCurrent : TFhirAddress;
begin
  Result := FList[FIndex];
end;


{ TFhirAddressList }
procedure TFhirAddressList.AddItem(value: TFhirAddress);
begin
  assert(value.ClassName = 'TFhirAddress', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirAddress');
  add(value);
end;


function TFhirAddressList.Append: TFhirAddress;
begin
  result := TFhirAddress.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirAddressList.ClearItems;
begin
  Clear;
end;

function TFhirAddressList.GetEnumerator : TFhirAddressListEnumerator;
begin
  result := TFhirAddressListEnumerator.Create(self.link);
end;

function TFhirAddressList.Clone: TFhirAddressList;
begin
  result := TFhirAddressList(inherited Clone);
end;

function TFhirAddressList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirAddressList.GetItemN(index: Integer): TFhirAddress;
begin
  result := TFhirAddress(ObjectByIndex[index]);
end;

function TFhirAddressList.IndexOf(value: TFhirAddress): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirAddressList.Insert(index: Integer): TFhirAddress;
begin
  result := TFhirAddress.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirAddressList.InsertItem(index: Integer; value: TFhirAddress);
begin
  assert(value is TFhirAddress);
  Inherited Insert(index, value);
end;

function TFhirAddressList.Item(index: Integer): TFhirAddress;
begin
  result := TFhirAddress(ObjectByIndex[index]);
end;

function TFhirAddressList.Link: TFhirAddressList;
begin
  result := TFhirAddressList(inherited Link);
end;

procedure TFhirAddressList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirAddressList.SetItemByIndex(index: Integer; value: TFhirAddress);
begin
  assert(value is TFhirAddress);
  FhirAddresses[index] := value;
end;

procedure TFhirAddressList.SetItemN(index: Integer; value: TFhirAddress);
begin
  assert(value is TFhirAddress);
  ObjectByIndex[index] := value;
end;

function TFhirNameUseListAsInteger(aSet : TFhirNameUseList) : Integer;
var
  a : TFhirNameUse;
begin
  result := 0;
  for a := low(TFhirNameUse) to high(TFhirNameUse) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirNameUseList(i : Integer) : TFhirNameUseList;
var
  aLoop : TFhirNameUse;
begin
  result := [];
  for aLoop := low(TFhirNameUse) to high(TFhirNameUse) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


{ TFhirHumanName }

constructor TFhirHumanName.Create;
begin
  inherited;
end;

destructor TFhirHumanName.Destroy;
begin
  FUse.free;
  FText.free;
  FFamilyList.Free;
  FGivenList.Free;
  FPrefixList.Free;
  FSuffixList.Free;
  FPeriod.free;
  inherited;
end;

procedure TFhirHumanName.Assign(oSource : TAdvObject);
begin
  inherited;
  FUse := TFhirHumanName(oSource).FUse.Link;
  textElement := TFhirHumanName(oSource).textElement.Clone;
  if (TFhirHumanName(oSource).FFamilyList = nil) then
  begin
    FFamilyList.free;
    FFamilyList := nil;
  end
  else
  begin
    FFamilyList := TFhirStringList.Create;
  FFamilyList.Assign(TFhirHumanName(oSource).FFamilyList);
  end;
  if (TFhirHumanName(oSource).FGivenList = nil) then
  begin
    FGivenList.free;
    FGivenList := nil;
  end
  else
  begin
    FGivenList := TFhirStringList.Create;
  FGivenList.Assign(TFhirHumanName(oSource).FGivenList);
  end;
  if (TFhirHumanName(oSource).FPrefixList = nil) then
  begin
    FPrefixList.free;
    FPrefixList := nil;
  end
  else
  begin
    FPrefixList := TFhirStringList.Create;
  FPrefixList.Assign(TFhirHumanName(oSource).FPrefixList);
  end;
  if (TFhirHumanName(oSource).FSuffixList = nil) then
  begin
    FSuffixList.free;
    FSuffixList := nil;
  end
  else
  begin
    FSuffixList := TFhirStringList.Create;
  FSuffixList.Assign(TFhirHumanName(oSource).FSuffixList);
  end;
  period := TFhirHumanName(oSource).period.Clone;
end;

procedure TFhirHumanName.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'use') Then
     list.add(FUse.Link);
  if (child_name = 'text') Then
     list.add(FText.Link);
  if (child_name = 'family') Then
    list.addAll(FFamilyList);
  if (child_name = 'given') Then
    list.addAll(FGivenList);
  if (child_name = 'prefix') Then
    list.addAll(FPrefixList);
  if (child_name = 'suffix') Then
    list.addAll(FSuffixList);
  if (child_name = 'period') Then
     list.add(FPeriod.Link);
end;

procedure TFhirHumanName.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'use', 'code', FUse.Link));{1}
  oList.add(TFHIRProperty.create(self, 'text', 'string', FText.Link));{2}
  oList.add(TFHIRProperty.create(self, 'family', 'string', FFamilyList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'given', 'string', FGivenList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'prefix', 'string', FPrefixList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'suffix', 'string', FSuffixList.Link)){3};
  oList.add(TFHIRProperty.create(self, 'period', 'Period', FPeriod.Link));{2}
end;

procedure TFhirHumanName.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'use') then UseElement := propValue as TFHIREnum
  else if (propName = 'text') then TextElement := propValue as TFhirString{5a}
  else if (propName = 'family') then FamilyList.add(propValue as TFhirString){2}
  else if (propName = 'given') then GivenList.add(propValue as TFhirString){2}
  else if (propName = 'prefix') then PrefixList.add(propValue as TFhirString){2}
  else if (propName = 'suffix') then SuffixList.add(propValue as TFhirString){2}
  else if (propName = 'period') then Period := propValue as TFhirPeriod{4b}
  else inherited;
end;

function TFhirHumanName.FhirType : string;
begin
  result := 'HumanName';
end;

function TFhirHumanName.Link : TFhirHumanName;
begin
  result := TFhirHumanName(inherited Link);
end;

function TFhirHumanName.Clone : TFhirHumanName;
begin
  result := TFhirHumanName(inherited Clone);
end;

{ TFhirHumanName }

Procedure TFhirHumanName.SetUse(value : TFhirEnum);
begin
  FUse.free;
  FUse := value;
end;

Function TFhirHumanName.GetUseST : TFhirNameUse;
begin
  if FUse = nil then
    result := TFhirNameUse(0)
  else
    result := TFhirNameUse(StringArrayIndexOfSensitive(CODES_TFhirNameUse, FUse.value));
end;

Procedure TFhirHumanName.SetUseST(value : TFhirNameUse);
begin
  if ord(value) = 0 then
    UseElement := nil
  else
    UseElement := TFhirEnum.create(CODES_TFhirNameUse[value]);
end;

Procedure TFhirHumanName.SetText(value : TFhirString);
begin
  FText.free;
  FText := value;
end;

Function TFhirHumanName.GetTextST : String;
begin
  if FText = nil then
    result := ''
  else
    result := FText.value;
end;

Procedure TFhirHumanName.SetTextST(value : String);
begin
  if value <> '' then
  begin
    if FText = nil then
      FText := TFhirString.create;
    FText.value := value
  end
  else if FText <> nil then
    FText.value := '';
end;

Function TFhirHumanName.GetFamilyList : TFhirStringList;
begin
  if FFamilyList = nil then
    FFamilyList := TFhirStringList.Create;
  result := FFamilyList;
end;

Function TFhirHumanName.GetHasFamilyList : boolean;
begin
  result := (FFamilyList <> nil) and (FFamilyList.count > 0);
end;

Function TFhirHumanName.GetGivenList : TFhirStringList;
begin
  if FGivenList = nil then
    FGivenList := TFhirStringList.Create;
  result := FGivenList;
end;

Function TFhirHumanName.GetHasGivenList : boolean;
begin
  result := (FGivenList <> nil) and (FGivenList.count > 0);
end;

Function TFhirHumanName.GetPrefixList : TFhirStringList;
begin
  if FPrefixList = nil then
    FPrefixList := TFhirStringList.Create;
  result := FPrefixList;
end;

Function TFhirHumanName.GetHasPrefixList : boolean;
begin
  result := (FPrefixList <> nil) and (FPrefixList.count > 0);
end;

Function TFhirHumanName.GetSuffixList : TFhirStringList;
begin
  if FSuffixList = nil then
    FSuffixList := TFhirStringList.Create;
  result := FSuffixList;
end;

Function TFhirHumanName.GetHasSuffixList : boolean;
begin
  result := (FSuffixList <> nil) and (FSuffixList.count > 0);
end;

Procedure TFhirHumanName.SetPeriod(value : TFhirPeriod);
begin
  FPeriod.free;
  FPeriod := value;
end;


{ TFhirHumanNameListEnumerator }

Constructor TFhirHumanNameListEnumerator.Create(list : TFhirHumanNameList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirHumanNameListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirHumanNameListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirHumanNameListEnumerator.GetCurrent : TFhirHumanName;
begin
  Result := FList[FIndex];
end;


{ TFhirHumanNameList }
procedure TFhirHumanNameList.AddItem(value: TFhirHumanName);
begin
  assert(value.ClassName = 'TFhirHumanName', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirHumanName');
  add(value);
end;


function TFhirHumanNameList.Append: TFhirHumanName;
begin
  result := TFhirHumanName.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirHumanNameList.ClearItems;
begin
  Clear;
end;

function TFhirHumanNameList.GetEnumerator : TFhirHumanNameListEnumerator;
begin
  result := TFhirHumanNameListEnumerator.Create(self.link);
end;

function TFhirHumanNameList.Clone: TFhirHumanNameList;
begin
  result := TFhirHumanNameList(inherited Clone);
end;

function TFhirHumanNameList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirHumanNameList.GetItemN(index: Integer): TFhirHumanName;
begin
  result := TFhirHumanName(ObjectByIndex[index]);
end;

function TFhirHumanNameList.IndexOf(value: TFhirHumanName): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirHumanNameList.Insert(index: Integer): TFhirHumanName;
begin
  result := TFhirHumanName.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirHumanNameList.InsertItem(index: Integer; value: TFhirHumanName);
begin
  assert(value is TFhirHumanName);
  Inherited Insert(index, value);
end;

function TFhirHumanNameList.Item(index: Integer): TFhirHumanName;
begin
  result := TFhirHumanName(ObjectByIndex[index]);
end;

function TFhirHumanNameList.Link: TFhirHumanNameList;
begin
  result := TFhirHumanNameList(inherited Link);
end;

procedure TFhirHumanNameList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirHumanNameList.SetItemByIndex(index: Integer; value: TFhirHumanName);
begin
  assert(value is TFhirHumanName);
  FhirHumanNames[index] := value;
end;

procedure TFhirHumanNameList.SetItemN(index: Integer; value: TFhirHumanName);
begin
  assert(value is TFhirHumanName);
  ObjectByIndex[index] := value;
end;

function TFhirContactPointSystemListAsInteger(aSet : TFhirContactPointSystemList) : Integer;
var
  a : TFhirContactPointSystem;
begin
  result := 0;
  for a := low(TFhirContactPointSystem) to high(TFhirContactPointSystem) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirContactPointSystemList(i : Integer) : TFhirContactPointSystemList;
var
  aLoop : TFhirContactPointSystem;
begin
  result := [];
  for aLoop := low(TFhirContactPointSystem) to high(TFhirContactPointSystem) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirContactPointUseListAsInteger(aSet : TFhirContactPointUseList) : Integer;
var
  a : TFhirContactPointUse;
begin
  result := 0;
  for a := low(TFhirContactPointUse) to high(TFhirContactPointUse) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirContactPointUseList(i : Integer) : TFhirContactPointUseList;
var
  aLoop : TFhirContactPointUse;
begin
  result := [];
  for aLoop := low(TFhirContactPointUse) to high(TFhirContactPointUse) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


{ TFhirContactPoint }

constructor TFhirContactPoint.Create;
begin
  inherited;
end;

destructor TFhirContactPoint.Destroy;
begin
  FSystem.free;
  FValue.free;
  FUse.free;
  FPeriod.free;
  inherited;
end;

procedure TFhirContactPoint.Assign(oSource : TAdvObject);
begin
  inherited;
  FSystem := TFhirContactPoint(oSource).FSystem.Link;
  valueElement := TFhirContactPoint(oSource).valueElement.Clone;
  FUse := TFhirContactPoint(oSource).FUse.Link;
  period := TFhirContactPoint(oSource).period.Clone;
end;

procedure TFhirContactPoint.GetChildrenByName(child_name : string; list : TFHIRObjectList);
begin
  inherited;
  if (child_name = 'system') Then
     list.add(FSystem.Link);
  if (child_name = 'value') Then
     list.add(FValue.Link);
  if (child_name = 'use') Then
     list.add(FUse.Link);
  if (child_name = 'period') Then
     list.add(FPeriod.Link);
end;

procedure TFhirContactPoint.ListProperties(oList: TFHIRPropertyList; bInheritedProperties: Boolean);
begin
  inherited;
  oList.add(TFHIRProperty.create(self, 'system', 'code', FSystem.Link));{1}
  oList.add(TFHIRProperty.create(self, 'value', 'string', FValue.Link));{2}
  oList.add(TFHIRProperty.create(self, 'use', 'code', FUse.Link));{1}
  oList.add(TFHIRProperty.create(self, 'period', 'Period', FPeriod.Link));{2}
end;

procedure TFhirContactPoint.setProperty(propName: string; propValue: TFHIRObject);
begin
  if (propName = 'system') then SystemElement := propValue as TFHIREnum
  else if (propName = 'value') then ValueElement := propValue as TFhirString{5a}
  else if (propName = 'use') then UseElement := propValue as TFHIREnum
  else if (propName = 'period') then Period := propValue as TFhirPeriod{4b}
  else inherited;
end;

function TFhirContactPoint.FhirType : string;
begin
  result := 'ContactPoint';
end;

function TFhirContactPoint.Link : TFhirContactPoint;
begin
  result := TFhirContactPoint(inherited Link);
end;

function TFhirContactPoint.Clone : TFhirContactPoint;
begin
  result := TFhirContactPoint(inherited Clone);
end;

{ TFhirContactPoint }

Procedure TFhirContactPoint.SetSystem(value : TFhirEnum);
begin
  FSystem.free;
  FSystem := value;
end;

Function TFhirContactPoint.GetSystemST : TFhirContactPointSystem;
begin
  if FSystem = nil then
    result := TFhirContactPointSystem(0)
  else
    result := TFhirContactPointSystem(StringArrayIndexOfSensitive(CODES_TFhirContactPointSystem, FSystem.value));
end;

Procedure TFhirContactPoint.SetSystemST(value : TFhirContactPointSystem);
begin
  if ord(value) = 0 then
    SystemElement := nil
  else
    SystemElement := TFhirEnum.create(CODES_TFhirContactPointSystem[value]);
end;

Procedure TFhirContactPoint.SetValue(value : TFhirString);
begin
  FValue.free;
  FValue := value;
end;

Function TFhirContactPoint.GetValueST : String;
begin
  if FValue = nil then
    result := ''
  else
    result := FValue.value;
end;

Procedure TFhirContactPoint.SetValueST(value : String);
begin
  if value <> '' then
  begin
    if FValue = nil then
      FValue := TFhirString.create;
    FValue.value := value
  end
  else if FValue <> nil then
    FValue.value := '';
end;

Procedure TFhirContactPoint.SetUse(value : TFhirEnum);
begin
  FUse.free;
  FUse := value;
end;

Function TFhirContactPoint.GetUseST : TFhirContactPointUse;
begin
  if FUse = nil then
    result := TFhirContactPointUse(0)
  else
    result := TFhirContactPointUse(StringArrayIndexOfSensitive(CODES_TFhirContactPointUse, FUse.value));
end;

Procedure TFhirContactPoint.SetUseST(value : TFhirContactPointUse);
begin
  if ord(value) = 0 then
    UseElement := nil
  else
    UseElement := TFhirEnum.create(CODES_TFhirContactPointUse[value]);
end;

Procedure TFhirContactPoint.SetPeriod(value : TFhirPeriod);
begin
  FPeriod.free;
  FPeriod := value;
end;


{ TFhirContactPointListEnumerator }

Constructor TFhirContactPointListEnumerator.Create(list : TFhirContactPointList);
begin
  inherited Create;
  FIndex := -1;
  FList := list;
end;

Destructor TFhirContactPointListEnumerator.Destroy;
begin
  FList.Free;
  inherited;
end;

function TFhirContactPointListEnumerator.MoveNext : boolean;
begin
  inc(FIndex);
  Result := FIndex < FList.count;
end;

function TFhirContactPointListEnumerator.GetCurrent : TFhirContactPoint;
begin
  Result := FList[FIndex];
end;


{ TFhirContactPointList }
procedure TFhirContactPointList.AddItem(value: TFhirContactPoint);
begin
  assert(value.ClassName = 'TFhirContactPoint', 'Attempt to add an item of type '+value.ClassName+' to a List of TFhirContactPoint');
  add(value);
end;


function TFhirContactPointList.Append: TFhirContactPoint;
begin
  result := TFhirContactPoint.create;
  try
    add(result.Link);
  finally
    result.free;
  end;
end;


procedure TFhirContactPointList.ClearItems;
begin
  Clear;
end;

function TFhirContactPointList.GetEnumerator : TFhirContactPointListEnumerator;
begin
  result := TFhirContactPointListEnumerator.Create(self.link);
end;

function TFhirContactPointList.Clone: TFhirContactPointList;
begin
  result := TFhirContactPointList(inherited Clone);
end;

function TFhirContactPointList.Count: Integer;
begin
  result := Inherited Count;
end;

function TFhirContactPointList.GetItemN(index: Integer): TFhirContactPoint;
begin
  result := TFhirContactPoint(ObjectByIndex[index]);
end;

function TFhirContactPointList.IndexOf(value: TFhirContactPoint): Integer;
begin
  result := IndexByReference(value);
end;


function TFhirContactPointList.Insert(index: Integer): TFhirContactPoint;
begin
  result := TFhirContactPoint.create;
  try
    inherited insert(index, result);
  finally
    result.free;
  end;
end;


procedure TFhirContactPointList.InsertItem(index: Integer; value: TFhirContactPoint);
begin
  assert(value is TFhirContactPoint);
  Inherited Insert(index, value);
end;

function TFhirContactPointList.Item(index: Integer): TFhirContactPoint;
begin
  result := TFhirContactPoint(ObjectByIndex[index]);
end;

function TFhirContactPointList.Link: TFhirContactPointList;
begin
  result := TFhirContactPointList(inherited Link);
end;

procedure TFhirContactPointList.Remove(index: Integer);
begin
  DeleteByIndex(index);
end;

procedure TFhirContactPointList.SetItemByIndex(index: Integer; value: TFhirContactPoint);
begin
  assert(value is TFhirContactPoint);
  FhirContactPoints[index] := value;
end;

procedure TFhirContactPointList.SetItemN(index: Integer; value: TFhirContactPoint);
begin
  assert(value is TFhirContactPoint);
  ObjectByIndex[index] := value;
end;

function TFhirAlertStatusListAsInteger(aSet : TFhirAlertStatusList) : Integer;
var
  a : TFhirAlertStatus;
begin
  result := 0;
  for a := low(TFhirAlertStatus) to high(TFhirAlertStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAlertStatusList(i : Integer) : TFhirAlertStatusList;
var
  aLoop : TFhirAlertStatus;
begin
  result := [];
  for aLoop := low(TFhirAlertStatus) to high(TFhirAlertStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirAllergyIntoleranceStatusListAsInteger(aSet : TFhirAllergyIntoleranceStatusList) : Integer;
var
  a : TFhirAllergyIntoleranceStatus;
begin
  result := 0;
  for a := low(TFhirAllergyIntoleranceStatus) to high(TFhirAllergyIntoleranceStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAllergyIntoleranceStatusList(i : Integer) : TFhirAllergyIntoleranceStatusList;
var
  aLoop : TFhirAllergyIntoleranceStatus;
begin
  result := [];
  for aLoop := low(TFhirAllergyIntoleranceStatus) to high(TFhirAllergyIntoleranceStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirAllergyIntoleranceCriticalityListAsInteger(aSet : TFhirAllergyIntoleranceCriticalityList) : Integer;
var
  a : TFhirAllergyIntoleranceCriticality;
begin
  result := 0;
  for a := low(TFhirAllergyIntoleranceCriticality) to high(TFhirAllergyIntoleranceCriticality) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAllergyIntoleranceCriticalityList(i : Integer) : TFhirAllergyIntoleranceCriticalityList;
var
  aLoop : TFhirAllergyIntoleranceCriticality;
begin
  result := [];
  for aLoop := low(TFhirAllergyIntoleranceCriticality) to high(TFhirAllergyIntoleranceCriticality) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirAllergyIntoleranceTypeListAsInteger(aSet : TFhirAllergyIntoleranceTypeList) : Integer;
var
  a : TFhirAllergyIntoleranceType;
begin
  result := 0;
  for a := low(TFhirAllergyIntoleranceType) to high(TFhirAllergyIntoleranceType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAllergyIntoleranceTypeList(i : Integer) : TFhirAllergyIntoleranceTypeList;
var
  aLoop : TFhirAllergyIntoleranceType;
begin
  result := [];
  for aLoop := low(TFhirAllergyIntoleranceType) to high(TFhirAllergyIntoleranceType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirAllergyIntoleranceCategoryListAsInteger(aSet : TFhirAllergyIntoleranceCategoryList) : Integer;
var
  a : TFhirAllergyIntoleranceCategory;
begin
  result := 0;
  for a := low(TFhirAllergyIntoleranceCategory) to high(TFhirAllergyIntoleranceCategory) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAllergyIntoleranceCategoryList(i : Integer) : TFhirAllergyIntoleranceCategoryList;
var
  aLoop : TFhirAllergyIntoleranceCategory;
begin
  result := [];
  for aLoop := low(TFhirAllergyIntoleranceCategory) to high(TFhirAllergyIntoleranceCategory) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirReactionEventCertaintyListAsInteger(aSet : TFhirReactionEventCertaintyList) : Integer;
var
  a : TFhirReactionEventCertainty;
begin
  result := 0;
  for a := low(TFhirReactionEventCertainty) to high(TFhirReactionEventCertainty) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirReactionEventCertaintyList(i : Integer) : TFhirReactionEventCertaintyList;
var
  aLoop : TFhirReactionEventCertainty;
begin
  result := [];
  for aLoop := low(TFhirReactionEventCertainty) to high(TFhirReactionEventCertainty) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirReactionEventSeverityListAsInteger(aSet : TFhirReactionEventSeverityList) : Integer;
var
  a : TFhirReactionEventSeverity;
begin
  result := 0;
  for a := low(TFhirReactionEventSeverity) to high(TFhirReactionEventSeverity) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirReactionEventSeverityList(i : Integer) : TFhirReactionEventSeverityList;
var
  aLoop : TFhirReactionEventSeverity;
begin
  result := [];
  for aLoop := low(TFhirReactionEventSeverity) to high(TFhirReactionEventSeverity) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirAppointmentstatusListAsInteger(aSet : TFhirAppointmentstatusList) : Integer;
var
  a : TFhirAppointmentstatus;
begin
  result := 0;
  for a := low(TFhirAppointmentstatus) to high(TFhirAppointmentstatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAppointmentstatusList(i : Integer) : TFhirAppointmentstatusList;
var
  aLoop : TFhirAppointmentstatus;
begin
  result := [];
  for aLoop := low(TFhirAppointmentstatus) to high(TFhirAppointmentstatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirParticipantrequiredListAsInteger(aSet : TFhirParticipantrequiredList) : Integer;
var
  a : TFhirParticipantrequired;
begin
  result := 0;
  for a := low(TFhirParticipantrequired) to high(TFhirParticipantrequired) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirParticipantrequiredList(i : Integer) : TFhirParticipantrequiredList;
var
  aLoop : TFhirParticipantrequired;
begin
  result := [];
  for aLoop := low(TFhirParticipantrequired) to high(TFhirParticipantrequired) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirParticipationstatusListAsInteger(aSet : TFhirParticipationstatusList) : Integer;
var
  a : TFhirParticipationstatus;
begin
  result := 0;
  for a := low(TFhirParticipationstatus) to high(TFhirParticipationstatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirParticipationstatusList(i : Integer) : TFhirParticipationstatusList;
var
  aLoop : TFhirParticipationstatus;
begin
  result := [];
  for aLoop := low(TFhirParticipationstatus) to high(TFhirParticipationstatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirParticipantstatusListAsInteger(aSet : TFhirParticipantstatusList) : Integer;
var
  a : TFhirParticipantstatus;
begin
  result := 0;
  for a := low(TFhirParticipantstatus) to high(TFhirParticipantstatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirParticipantstatusList(i : Integer) : TFhirParticipantstatusList;
var
  aLoop : TFhirParticipantstatus;
begin
  result := [];
  for aLoop := low(TFhirParticipantstatus) to high(TFhirParticipantstatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirBundleTypeListAsInteger(aSet : TFhirBundleTypeList) : Integer;
var
  a : TFhirBundleType;
begin
  result := 0;
  for a := low(TFhirBundleType) to high(TFhirBundleType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirBundleTypeList(i : Integer) : TFhirBundleTypeList;
var
  aLoop : TFhirBundleType;
begin
  result := [];
  for aLoop := low(TFhirBundleType) to high(TFhirBundleType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirBundleEntryStatusListAsInteger(aSet : TFhirBundleEntryStatusList) : Integer;
var
  a : TFhirBundleEntryStatus;
begin
  result := 0;
  for a := low(TFhirBundleEntryStatus) to high(TFhirBundleEntryStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirBundleEntryStatusList(i : Integer) : TFhirBundleEntryStatusList;
var
  aLoop : TFhirBundleEntryStatus;
begin
  result := [];
  for aLoop := low(TFhirBundleEntryStatus) to high(TFhirBundleEntryStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCarePlanStatusListAsInteger(aSet : TFhirCarePlanStatusList) : Integer;
var
  a : TFhirCarePlanStatus;
begin
  result := 0;
  for a := low(TFhirCarePlanStatus) to high(TFhirCarePlanStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCarePlanStatusList(i : Integer) : TFhirCarePlanStatusList;
var
  aLoop : TFhirCarePlanStatus;
begin
  result := [];
  for aLoop := low(TFhirCarePlanStatus) to high(TFhirCarePlanStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCarePlanGoalStatusListAsInteger(aSet : TFhirCarePlanGoalStatusList) : Integer;
var
  a : TFhirCarePlanGoalStatus;
begin
  result := 0;
  for a := low(TFhirCarePlanGoalStatus) to high(TFhirCarePlanGoalStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCarePlanGoalStatusList(i : Integer) : TFhirCarePlanGoalStatusList;
var
  aLoop : TFhirCarePlanGoalStatus;
begin
  result := [];
  for aLoop := low(TFhirCarePlanGoalStatus) to high(TFhirCarePlanGoalStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCarePlanActivityStatusListAsInteger(aSet : TFhirCarePlanActivityStatusList) : Integer;
var
  a : TFhirCarePlanActivityStatus;
begin
  result := 0;
  for a := low(TFhirCarePlanActivityStatus) to high(TFhirCarePlanActivityStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCarePlanActivityStatusList(i : Integer) : TFhirCarePlanActivityStatusList;
var
  aLoop : TFhirCarePlanActivityStatus;
begin
  result := [];
  for aLoop := low(TFhirCarePlanActivityStatus) to high(TFhirCarePlanActivityStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCarePlanActivityCategoryListAsInteger(aSet : TFhirCarePlanActivityCategoryList) : Integer;
var
  a : TFhirCarePlanActivityCategory;
begin
  result := 0;
  for a := low(TFhirCarePlanActivityCategory) to high(TFhirCarePlanActivityCategory) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCarePlanActivityCategoryList(i : Integer) : TFhirCarePlanActivityCategoryList;
var
  aLoop : TFhirCarePlanActivityCategory;
begin
  result := [];
  for aLoop := low(TFhirCarePlanActivityCategory) to high(TFhirCarePlanActivityCategory) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCarePlan2StatusListAsInteger(aSet : TFhirCarePlan2StatusList) : Integer;
var
  a : TFhirCarePlan2Status;
begin
  result := 0;
  for a := low(TFhirCarePlan2Status) to high(TFhirCarePlan2Status) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCarePlan2StatusList(i : Integer) : TFhirCarePlan2StatusList;
var
  aLoop : TFhirCarePlan2Status;
begin
  result := [];
  for aLoop := low(TFhirCarePlan2Status) to high(TFhirCarePlan2Status) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirRSLinkListAsInteger(aSet : TFhirRSLinkList) : Integer;
var
  a : TFhirRSLink;
begin
  result := 0;
  for a := low(TFhirRSLink) to high(TFhirRSLink) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirRSLinkList(i : Integer) : TFhirRSLinkList;
var
  aLoop : TFhirRSLink;
begin
  result := [];
  for aLoop := low(TFhirRSLink) to high(TFhirRSLink) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCommunicationStatusListAsInteger(aSet : TFhirCommunicationStatusList) : Integer;
var
  a : TFhirCommunicationStatus;
begin
  result := 0;
  for a := low(TFhirCommunicationStatus) to high(TFhirCommunicationStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCommunicationStatusList(i : Integer) : TFhirCommunicationStatusList;
var
  aLoop : TFhirCommunicationStatus;
begin
  result := [];
  for aLoop := low(TFhirCommunicationStatus) to high(TFhirCommunicationStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCommunicationRequestStatusListAsInteger(aSet : TFhirCommunicationRequestStatusList) : Integer;
var
  a : TFhirCommunicationRequestStatus;
begin
  result := 0;
  for a := low(TFhirCommunicationRequestStatus) to high(TFhirCommunicationRequestStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCommunicationRequestStatusList(i : Integer) : TFhirCommunicationRequestStatusList;
var
  aLoop : TFhirCommunicationRequestStatus;
begin
  result := [];
  for aLoop := low(TFhirCommunicationRequestStatus) to high(TFhirCommunicationRequestStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCompositionStatusListAsInteger(aSet : TFhirCompositionStatusList) : Integer;
var
  a : TFhirCompositionStatus;
begin
  result := 0;
  for a := low(TFhirCompositionStatus) to high(TFhirCompositionStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCompositionStatusList(i : Integer) : TFhirCompositionStatusList;
var
  aLoop : TFhirCompositionStatus;
begin
  result := [];
  for aLoop := low(TFhirCompositionStatus) to high(TFhirCompositionStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirCompositionAttestationModeListAsInteger(aSet : TFhirCompositionAttestationModeList) : Integer;
var
  a : TFhirCompositionAttestationMode;
begin
  result := 0;
  for a := low(TFhirCompositionAttestationMode) to high(TFhirCompositionAttestationMode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirCompositionAttestationModeList(i : Integer) : TFhirCompositionAttestationModeList;
var
  aLoop : TFhirCompositionAttestationMode;
begin
  result := [];
  for aLoop := low(TFhirCompositionAttestationMode) to high(TFhirCompositionAttestationMode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirValuesetStatusListAsInteger(aSet : TFhirValuesetStatusList) : Integer;
var
  a : TFhirValuesetStatus;
begin
  result := 0;
  for a := low(TFhirValuesetStatus) to high(TFhirValuesetStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirValuesetStatusList(i : Integer) : TFhirValuesetStatusList;
var
  aLoop : TFhirValuesetStatus;
begin
  result := [];
  for aLoop := low(TFhirValuesetStatus) to high(TFhirValuesetStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirConceptEquivalenceListAsInteger(aSet : TFhirConceptEquivalenceList) : Integer;
var
  a : TFhirConceptEquivalence;
begin
  result := 0;
  for a := low(TFhirConceptEquivalence) to high(TFhirConceptEquivalence) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirConceptEquivalenceList(i : Integer) : TFhirConceptEquivalenceList;
var
  aLoop : TFhirConceptEquivalence;
begin
  result := [];
  for aLoop := low(TFhirConceptEquivalence) to high(TFhirConceptEquivalence) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirConditionStatusListAsInteger(aSet : TFhirConditionStatusList) : Integer;
var
  a : TFhirConditionStatus;
begin
  result := 0;
  for a := low(TFhirConditionStatus) to high(TFhirConditionStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirConditionStatusList(i : Integer) : TFhirConditionStatusList;
var
  aLoop : TFhirConditionStatus;
begin
  result := [];
  for aLoop := low(TFhirConditionStatus) to high(TFhirConditionStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirConformanceStatementStatusListAsInteger(aSet : TFhirConformanceStatementStatusList) : Integer;
var
  a : TFhirConformanceStatementStatus;
begin
  result := 0;
  for a := low(TFhirConformanceStatementStatus) to high(TFhirConformanceStatementStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirConformanceStatementStatusList(i : Integer) : TFhirConformanceStatementStatusList;
var
  aLoop : TFhirConformanceStatementStatus;
begin
  result := [];
  for aLoop := low(TFhirConformanceStatementStatus) to high(TFhirConformanceStatementStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirRestfulConformanceModeListAsInteger(aSet : TFhirRestfulConformanceModeList) : Integer;
var
  a : TFhirRestfulConformanceMode;
begin
  result := 0;
  for a := low(TFhirRestfulConformanceMode) to high(TFhirRestfulConformanceMode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirRestfulConformanceModeList(i : Integer) : TFhirRestfulConformanceModeList;
var
  aLoop : TFhirRestfulConformanceMode;
begin
  result := [];
  for aLoop := low(TFhirRestfulConformanceMode) to high(TFhirRestfulConformanceMode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirTypeRestfulInteractionListAsInteger(aSet : TFhirTypeRestfulInteractionList) : Integer;
var
  a : TFhirTypeRestfulInteraction;
begin
  result := 0;
  for a := low(TFhirTypeRestfulInteraction) to high(TFhirTypeRestfulInteraction) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirTypeRestfulInteractionList(i : Integer) : TFhirTypeRestfulInteractionList;
var
  aLoop : TFhirTypeRestfulInteraction;
begin
  result := [];
  for aLoop := low(TFhirTypeRestfulInteraction) to high(TFhirTypeRestfulInteraction) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirVersioningPolicyListAsInteger(aSet : TFhirVersioningPolicyList) : Integer;
var
  a : TFhirVersioningPolicy;
begin
  result := 0;
  for a := low(TFhirVersioningPolicy) to high(TFhirVersioningPolicy) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirVersioningPolicyList(i : Integer) : TFhirVersioningPolicyList;
var
  aLoop : TFhirVersioningPolicy;
begin
  result := [];
  for aLoop := low(TFhirVersioningPolicy) to high(TFhirVersioningPolicy) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirSearchParamTypeListAsInteger(aSet : TFhirSearchParamTypeList) : Integer;
var
  a : TFhirSearchParamType;
begin
  result := 0;
  for a := low(TFhirSearchParamType) to high(TFhirSearchParamType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirSearchParamTypeList(i : Integer) : TFhirSearchParamTypeList;
var
  aLoop : TFhirSearchParamType;
begin
  result := [];
  for aLoop := low(TFhirSearchParamType) to high(TFhirSearchParamType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirSystemRestfulInteractionListAsInteger(aSet : TFhirSystemRestfulInteractionList) : Integer;
var
  a : TFhirSystemRestfulInteraction;
begin
  result := 0;
  for a := low(TFhirSystemRestfulInteraction) to high(TFhirSystemRestfulInteraction) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirSystemRestfulInteractionList(i : Integer) : TFhirSystemRestfulInteractionList;
var
  aLoop : TFhirSystemRestfulInteraction;
begin
  result := [];
  for aLoop := low(TFhirSystemRestfulInteraction) to high(TFhirSystemRestfulInteraction) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMessageSignificanceCategoryListAsInteger(aSet : TFhirMessageSignificanceCategoryList) : Integer;
var
  a : TFhirMessageSignificanceCategory;
begin
  result := 0;
  for a := low(TFhirMessageSignificanceCategory) to high(TFhirMessageSignificanceCategory) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMessageSignificanceCategoryList(i : Integer) : TFhirMessageSignificanceCategoryList;
var
  aLoop : TFhirMessageSignificanceCategory;
begin
  result := [];
  for aLoop := low(TFhirMessageSignificanceCategory) to high(TFhirMessageSignificanceCategory) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMessageConformanceEventModeListAsInteger(aSet : TFhirMessageConformanceEventModeList) : Integer;
var
  a : TFhirMessageConformanceEventMode;
begin
  result := 0;
  for a := low(TFhirMessageConformanceEventMode) to high(TFhirMessageConformanceEventMode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMessageConformanceEventModeList(i : Integer) : TFhirMessageConformanceEventModeList;
var
  aLoop : TFhirMessageConformanceEventMode;
begin
  result := [];
  for aLoop := low(TFhirMessageConformanceEventMode) to high(TFhirMessageConformanceEventMode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDocumentModeListAsInteger(aSet : TFhirDocumentModeList) : Integer;
var
  a : TFhirDocumentMode;
begin
  result := 0;
  for a := low(TFhirDocumentMode) to high(TFhirDocumentMode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDocumentModeList(i : Integer) : TFhirDocumentModeList;
var
  aLoop : TFhirDocumentMode;
begin
  result := [];
  for aLoop := low(TFhirDocumentMode) to high(TFhirDocumentMode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirResourceObservationDefStatusListAsInteger(aSet : TFhirResourceObservationDefStatusList) : Integer;
var
  a : TFhirResourceObservationDefStatus;
begin
  result := 0;
  for a := low(TFhirResourceObservationDefStatus) to high(TFhirResourceObservationDefStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirResourceObservationDefStatusList(i : Integer) : TFhirResourceObservationDefStatusList;
var
  aLoop : TFhirResourceObservationDefStatus;
begin
  result := [];
  for aLoop := low(TFhirResourceObservationDefStatus) to high(TFhirResourceObservationDefStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDataelementGranularityListAsInteger(aSet : TFhirDataelementGranularityList) : Integer;
var
  a : TFhirDataelementGranularity;
begin
  result := 0;
  for a := low(TFhirDataelementGranularity) to high(TFhirDataelementGranularity) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDataelementGranularityList(i : Integer) : TFhirDataelementGranularityList;
var
  aLoop : TFhirDataelementGranularity;
begin
  result := [];
  for aLoop := low(TFhirDataelementGranularity) to high(TFhirDataelementGranularity) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMeasurementPrincipleListAsInteger(aSet : TFhirMeasurementPrincipleList) : Integer;
var
  a : TFhirMeasurementPrinciple;
begin
  result := 0;
  for a := low(TFhirMeasurementPrinciple) to high(TFhirMeasurementPrinciple) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMeasurementPrincipleList(i : Integer) : TFhirMeasurementPrincipleList;
var
  aLoop : TFhirMeasurementPrinciple;
begin
  result := [];
  for aLoop := low(TFhirMeasurementPrinciple) to high(TFhirMeasurementPrinciple) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMetricOperationalStatusListAsInteger(aSet : TFhirMetricOperationalStatusList) : Integer;
var
  a : TFhirMetricOperationalStatus;
begin
  result := 0;
  for a := low(TFhirMetricOperationalStatus) to high(TFhirMetricOperationalStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMetricOperationalStatusList(i : Integer) : TFhirMetricOperationalStatusList;
var
  aLoop : TFhirMetricOperationalStatus;
begin
  result := [];
  for aLoop := low(TFhirMetricOperationalStatus) to high(TFhirMetricOperationalStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMetricCategoryListAsInteger(aSet : TFhirMetricCategoryList) : Integer;
var
  a : TFhirMetricCategory;
begin
  result := 0;
  for a := low(TFhirMetricCategory) to high(TFhirMetricCategory) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMetricCategoryList(i : Integer) : TFhirMetricCategoryList;
var
  aLoop : TFhirMetricCategory;
begin
  result := [];
  for aLoop := low(TFhirMetricCategory) to high(TFhirMetricCategory) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMetricCalibrationTypeListAsInteger(aSet : TFhirMetricCalibrationTypeList) : Integer;
var
  a : TFhirMetricCalibrationType;
begin
  result := 0;
  for a := low(TFhirMetricCalibrationType) to high(TFhirMetricCalibrationType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMetricCalibrationTypeList(i : Integer) : TFhirMetricCalibrationTypeList;
var
  aLoop : TFhirMetricCalibrationType;
begin
  result := [];
  for aLoop := low(TFhirMetricCalibrationType) to high(TFhirMetricCalibrationType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMetricCalibrationStateListAsInteger(aSet : TFhirMetricCalibrationStateList) : Integer;
var
  a : TFhirMetricCalibrationState;
begin
  result := 0;
  for a := low(TFhirMetricCalibrationState) to high(TFhirMetricCalibrationState) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMetricCalibrationStateList(i : Integer) : TFhirMetricCalibrationStateList;
var
  aLoop : TFhirMetricCalibrationState;
begin
  result := [];
  for aLoop := low(TFhirMetricCalibrationState) to high(TFhirMetricCalibrationState) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDeviceUseRequestStatusListAsInteger(aSet : TFhirDeviceUseRequestStatusList) : Integer;
var
  a : TFhirDeviceUseRequestStatus;
begin
  result := 0;
  for a := low(TFhirDeviceUseRequestStatus) to high(TFhirDeviceUseRequestStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDeviceUseRequestStatusList(i : Integer) : TFhirDeviceUseRequestStatusList;
var
  aLoop : TFhirDeviceUseRequestStatus;
begin
  result := [];
  for aLoop := low(TFhirDeviceUseRequestStatus) to high(TFhirDeviceUseRequestStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDeviceUseRequestPriorityListAsInteger(aSet : TFhirDeviceUseRequestPriorityList) : Integer;
var
  a : TFhirDeviceUseRequestPriority;
begin
  result := 0;
  for a := low(TFhirDeviceUseRequestPriority) to high(TFhirDeviceUseRequestPriority) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDeviceUseRequestPriorityList(i : Integer) : TFhirDeviceUseRequestPriorityList;
var
  aLoop : TFhirDeviceUseRequestPriority;
begin
  result := [];
  for aLoop := low(TFhirDeviceUseRequestPriority) to high(TFhirDeviceUseRequestPriority) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDiagnosticOrderStatusListAsInteger(aSet : TFhirDiagnosticOrderStatusList) : Integer;
var
  a : TFhirDiagnosticOrderStatus;
begin
  result := 0;
  for a := low(TFhirDiagnosticOrderStatus) to high(TFhirDiagnosticOrderStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDiagnosticOrderStatusList(i : Integer) : TFhirDiagnosticOrderStatusList;
var
  aLoop : TFhirDiagnosticOrderStatus;
begin
  result := [];
  for aLoop := low(TFhirDiagnosticOrderStatus) to high(TFhirDiagnosticOrderStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDiagnosticOrderPriorityListAsInteger(aSet : TFhirDiagnosticOrderPriorityList) : Integer;
var
  a : TFhirDiagnosticOrderPriority;
begin
  result := 0;
  for a := low(TFhirDiagnosticOrderPriority) to high(TFhirDiagnosticOrderPriority) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDiagnosticOrderPriorityList(i : Integer) : TFhirDiagnosticOrderPriorityList;
var
  aLoop : TFhirDiagnosticOrderPriority;
begin
  result := [];
  for aLoop := low(TFhirDiagnosticOrderPriority) to high(TFhirDiagnosticOrderPriority) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDiagnosticReportStatusListAsInteger(aSet : TFhirDiagnosticReportStatusList) : Integer;
var
  a : TFhirDiagnosticReportStatus;
begin
  result := 0;
  for a := low(TFhirDiagnosticReportStatus) to high(TFhirDiagnosticReportStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDiagnosticReportStatusList(i : Integer) : TFhirDiagnosticReportStatusList;
var
  aLoop : TFhirDiagnosticReportStatus;
begin
  result := [];
  for aLoop := low(TFhirDiagnosticReportStatus) to high(TFhirDiagnosticReportStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDocumentReferenceStatusListAsInteger(aSet : TFhirDocumentReferenceStatusList) : Integer;
var
  a : TFhirDocumentReferenceStatus;
begin
  result := 0;
  for a := low(TFhirDocumentReferenceStatus) to high(TFhirDocumentReferenceStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDocumentReferenceStatusList(i : Integer) : TFhirDocumentReferenceStatusList;
var
  aLoop : TFhirDocumentReferenceStatus;
begin
  result := [];
  for aLoop := low(TFhirDocumentReferenceStatus) to high(TFhirDocumentReferenceStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDocumentRelationshipTypeListAsInteger(aSet : TFhirDocumentRelationshipTypeList) : Integer;
var
  a : TFhirDocumentRelationshipType;
begin
  result := 0;
  for a := low(TFhirDocumentRelationshipType) to high(TFhirDocumentRelationshipType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDocumentRelationshipTypeList(i : Integer) : TFhirDocumentRelationshipTypeList;
var
  aLoop : TFhirDocumentRelationshipType;
begin
  result := [];
  for aLoop := low(TFhirDocumentRelationshipType) to high(TFhirDocumentRelationshipType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirEncounterStateListAsInteger(aSet : TFhirEncounterStateList) : Integer;
var
  a : TFhirEncounterState;
begin
  result := 0;
  for a := low(TFhirEncounterState) to high(TFhirEncounterState) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirEncounterStateList(i : Integer) : TFhirEncounterStateList;
var
  aLoop : TFhirEncounterState;
begin
  result := [];
  for aLoop := low(TFhirEncounterState) to high(TFhirEncounterState) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirEncounterClassListAsInteger(aSet : TFhirEncounterClassList) : Integer;
var
  a : TFhirEncounterClass;
begin
  result := 0;
  for a := low(TFhirEncounterClass) to high(TFhirEncounterClass) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirEncounterClassList(i : Integer) : TFhirEncounterClassList;
var
  aLoop : TFhirEncounterClass;
begin
  result := [];
  for aLoop := low(TFhirEncounterClass) to high(TFhirEncounterClass) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirEncounterLocationStatusListAsInteger(aSet : TFhirEncounterLocationStatusList) : Integer;
var
  a : TFhirEncounterLocationStatus;
begin
  result := 0;
  for a := low(TFhirEncounterLocationStatus) to high(TFhirEncounterLocationStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirEncounterLocationStatusList(i : Integer) : TFhirEncounterLocationStatusList;
var
  aLoop : TFhirEncounterLocationStatus;
begin
  result := [];
  for aLoop := low(TFhirEncounterLocationStatus) to high(TFhirEncounterLocationStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirEpisodeOfCareStatusListAsInteger(aSet : TFhirEpisodeOfCareStatusList) : Integer;
var
  a : TFhirEpisodeOfCareStatus;
begin
  result := 0;
  for a := low(TFhirEpisodeOfCareStatus) to high(TFhirEpisodeOfCareStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirEpisodeOfCareStatusList(i : Integer) : TFhirEpisodeOfCareStatusList;
var
  aLoop : TFhirEpisodeOfCareStatus;
begin
  result := [];
  for aLoop := low(TFhirEpisodeOfCareStatus) to high(TFhirEpisodeOfCareStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirResourceProfileStatusListAsInteger(aSet : TFhirResourceProfileStatusList) : Integer;
var
  a : TFhirResourceProfileStatus;
begin
  result := 0;
  for a := low(TFhirResourceProfileStatus) to high(TFhirResourceProfileStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirResourceProfileStatusList(i : Integer) : TFhirResourceProfileStatusList;
var
  aLoop : TFhirResourceProfileStatus;
begin
  result := [];
  for aLoop := low(TFhirResourceProfileStatus) to high(TFhirResourceProfileStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirExtensionContextListAsInteger(aSet : TFhirExtensionContextList) : Integer;
var
  a : TFhirExtensionContext;
begin
  result := 0;
  for a := low(TFhirExtensionContext) to high(TFhirExtensionContext) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirExtensionContextList(i : Integer) : TFhirExtensionContextList;
var
  aLoop : TFhirExtensionContext;
begin
  result := [];
  for aLoop := low(TFhirExtensionContext) to high(TFhirExtensionContext) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirGoalStatusListAsInteger(aSet : TFhirGoalStatusList) : Integer;
var
  a : TFhirGoalStatus;
begin
  result := 0;
  for a := low(TFhirGoalStatus) to high(TFhirGoalStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirGoalStatusList(i : Integer) : TFhirGoalStatusList;
var
  aLoop : TFhirGoalStatus;
begin
  result := [];
  for aLoop := low(TFhirGoalStatus) to high(TFhirGoalStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirGroupTypeListAsInteger(aSet : TFhirGroupTypeList) : Integer;
var
  a : TFhirGroupType;
begin
  result := 0;
  for a := low(TFhirGroupType) to high(TFhirGroupType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirGroupTypeList(i : Integer) : TFhirGroupTypeList;
var
  aLoop : TFhirGroupType;
begin
  result := [];
  for aLoop := low(TFhirGroupType) to high(TFhirGroupType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirImagingModalityListAsInteger(aSet : TFhirImagingModalityList) : Integer;
var
  a : TFhirImagingModality;
begin
  result := 0;
  for a := low(TFhirImagingModality) to high(TFhirImagingModality) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirImagingModalityList(i : Integer) : TFhirImagingModalityList;
var
  aLoop : TFhirImagingModality;
begin
  result := [];
  for aLoop := low(TFhirImagingModality) to high(TFhirImagingModality) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirInstanceAvailabilityListAsInteger(aSet : TFhirInstanceAvailabilityList) : Integer;
var
  a : TFhirInstanceAvailability;
begin
  result := 0;
  for a := low(TFhirInstanceAvailability) to high(TFhirInstanceAvailability) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirInstanceAvailabilityList(i : Integer) : TFhirInstanceAvailabilityList;
var
  aLoop : TFhirInstanceAvailability;
begin
  result := [];
  for aLoop := low(TFhirInstanceAvailability) to high(TFhirInstanceAvailability) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirModalityListAsInteger(aSet : TFhirModalityList) : Integer;
var
  a : TFhirModality;
begin
  result := 0;
  for a := low(TFhirModality) to high(TFhirModality) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirModalityList(i : Integer) : TFhirModalityList;
var
  aLoop : TFhirModality;
begin
  result := [];
  for aLoop := low(TFhirModality) to high(TFhirModality) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirUseLinkListAsInteger(aSet : TFhirUseLinkList) : Integer;
var
  a : TFhirUseLink;
begin
  result := 0;
  for a := low(TFhirUseLink) to high(TFhirUseLink) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirUseLinkList(i : Integer) : TFhirUseLinkList;
var
  aLoop : TFhirUseLink;
begin
  result := [];
  for aLoop := low(TFhirUseLink) to high(TFhirUseLink) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirListModeListAsInteger(aSet : TFhirListModeList) : Integer;
var
  a : TFhirListMode;
begin
  result := 0;
  for a := low(TFhirListMode) to high(TFhirListMode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirListModeList(i : Integer) : TFhirListModeList;
var
  aLoop : TFhirListMode;
begin
  result := [];
  for aLoop := low(TFhirListMode) to high(TFhirListMode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirLocationStatusListAsInteger(aSet : TFhirLocationStatusList) : Integer;
var
  a : TFhirLocationStatus;
begin
  result := 0;
  for a := low(TFhirLocationStatus) to high(TFhirLocationStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirLocationStatusList(i : Integer) : TFhirLocationStatusList;
var
  aLoop : TFhirLocationStatus;
begin
  result := [];
  for aLoop := low(TFhirLocationStatus) to high(TFhirLocationStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirLocationModeListAsInteger(aSet : TFhirLocationModeList) : Integer;
var
  a : TFhirLocationMode;
begin
  result := 0;
  for a := low(TFhirLocationMode) to high(TFhirLocationMode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirLocationModeList(i : Integer) : TFhirLocationModeList;
var
  aLoop : TFhirLocationMode;
begin
  result := [];
  for aLoop := low(TFhirLocationMode) to high(TFhirLocationMode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMediaTypeListAsInteger(aSet : TFhirMediaTypeList) : Integer;
var
  a : TFhirMediaType;
begin
  result := 0;
  for a := low(TFhirMediaType) to high(TFhirMediaType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMediaTypeList(i : Integer) : TFhirMediaTypeList;
var
  aLoop : TFhirMediaType;
begin
  result := [];
  for aLoop := low(TFhirMediaType) to high(TFhirMediaType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMedicationKindListAsInteger(aSet : TFhirMedicationKindList) : Integer;
var
  a : TFhirMedicationKind;
begin
  result := 0;
  for a := low(TFhirMedicationKind) to high(TFhirMedicationKind) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMedicationKindList(i : Integer) : TFhirMedicationKindList;
var
  aLoop : TFhirMedicationKind;
begin
  result := [];
  for aLoop := low(TFhirMedicationKind) to high(TFhirMedicationKind) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMedicationAdminStatusListAsInteger(aSet : TFhirMedicationAdminStatusList) : Integer;
var
  a : TFhirMedicationAdminStatus;
begin
  result := 0;
  for a := low(TFhirMedicationAdminStatus) to high(TFhirMedicationAdminStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMedicationAdminStatusList(i : Integer) : TFhirMedicationAdminStatusList;
var
  aLoop : TFhirMedicationAdminStatus;
begin
  result := [];
  for aLoop := low(TFhirMedicationAdminStatus) to high(TFhirMedicationAdminStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMedicationDispenseStatusListAsInteger(aSet : TFhirMedicationDispenseStatusList) : Integer;
var
  a : TFhirMedicationDispenseStatus;
begin
  result := 0;
  for a := low(TFhirMedicationDispenseStatus) to high(TFhirMedicationDispenseStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMedicationDispenseStatusList(i : Integer) : TFhirMedicationDispenseStatusList;
var
  aLoop : TFhirMedicationDispenseStatus;
begin
  result := [];
  for aLoop := low(TFhirMedicationDispenseStatus) to high(TFhirMedicationDispenseStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirMedicationPrescriptionStatusListAsInteger(aSet : TFhirMedicationPrescriptionStatusList) : Integer;
var
  a : TFhirMedicationPrescriptionStatus;
begin
  result := 0;
  for a := low(TFhirMedicationPrescriptionStatus) to high(TFhirMedicationPrescriptionStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirMedicationPrescriptionStatusList(i : Integer) : TFhirMedicationPrescriptionStatusList;
var
  aLoop : TFhirMedicationPrescriptionStatus;
begin
  result := [];
  for aLoop := low(TFhirMedicationPrescriptionStatus) to high(TFhirMedicationPrescriptionStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirResponseCodeListAsInteger(aSet : TFhirResponseCodeList) : Integer;
var
  a : TFhirResponseCode;
begin
  result := 0;
  for a := low(TFhirResponseCode) to high(TFhirResponseCode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirResponseCodeList(i : Integer) : TFhirResponseCodeList;
var
  aLoop : TFhirResponseCode;
begin
  result := [];
  for aLoop := low(TFhirResponseCode) to high(TFhirResponseCode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirNamingsystemTypeListAsInteger(aSet : TFhirNamingsystemTypeList) : Integer;
var
  a : TFhirNamingsystemType;
begin
  result := 0;
  for a := low(TFhirNamingsystemType) to high(TFhirNamingsystemType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirNamingsystemTypeList(i : Integer) : TFhirNamingsystemTypeList;
var
  aLoop : TFhirNamingsystemType;
begin
  result := [];
  for aLoop := low(TFhirNamingsystemType) to high(TFhirNamingsystemType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirNamingsystemStatusListAsInteger(aSet : TFhirNamingsystemStatusList) : Integer;
var
  a : TFhirNamingsystemStatus;
begin
  result := 0;
  for a := low(TFhirNamingsystemStatus) to high(TFhirNamingsystemStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirNamingsystemStatusList(i : Integer) : TFhirNamingsystemStatusList;
var
  aLoop : TFhirNamingsystemStatus;
begin
  result := [];
  for aLoop := low(TFhirNamingsystemStatus) to high(TFhirNamingsystemStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirNamingsystemIdentifierTypeListAsInteger(aSet : TFhirNamingsystemIdentifierTypeList) : Integer;
var
  a : TFhirNamingsystemIdentifierType;
begin
  result := 0;
  for a := low(TFhirNamingsystemIdentifierType) to high(TFhirNamingsystemIdentifierType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirNamingsystemIdentifierTypeList(i : Integer) : TFhirNamingsystemIdentifierTypeList;
var
  aLoop : TFhirNamingsystemIdentifierType;
begin
  result := [];
  for aLoop := low(TFhirNamingsystemIdentifierType) to high(TFhirNamingsystemIdentifierType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirNutritionOrderStatusListAsInteger(aSet : TFhirNutritionOrderStatusList) : Integer;
var
  a : TFhirNutritionOrderStatus;
begin
  result := 0;
  for a := low(TFhirNutritionOrderStatus) to high(TFhirNutritionOrderStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirNutritionOrderStatusList(i : Integer) : TFhirNutritionOrderStatusList;
var
  aLoop : TFhirNutritionOrderStatus;
begin
  result := [];
  for aLoop := low(TFhirNutritionOrderStatus) to high(TFhirNutritionOrderStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirDataAbsentReasonListAsInteger(aSet : TFhirDataAbsentReasonList) : Integer;
var
  a : TFhirDataAbsentReason;
begin
  result := 0;
  for a := low(TFhirDataAbsentReason) to high(TFhirDataAbsentReason) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirDataAbsentReasonList(i : Integer) : TFhirDataAbsentReasonList;
var
  aLoop : TFhirDataAbsentReason;
begin
  result := [];
  for aLoop := low(TFhirDataAbsentReason) to high(TFhirDataAbsentReason) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirObservationStatusListAsInteger(aSet : TFhirObservationStatusList) : Integer;
var
  a : TFhirObservationStatus;
begin
  result := 0;
  for a := low(TFhirObservationStatus) to high(TFhirObservationStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirObservationStatusList(i : Integer) : TFhirObservationStatusList;
var
  aLoop : TFhirObservationStatus;
begin
  result := [];
  for aLoop := low(TFhirObservationStatus) to high(TFhirObservationStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirObservationReliabilityListAsInteger(aSet : TFhirObservationReliabilityList) : Integer;
var
  a : TFhirObservationReliability;
begin
  result := 0;
  for a := low(TFhirObservationReliability) to high(TFhirObservationReliability) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirObservationReliabilityList(i : Integer) : TFhirObservationReliabilityList;
var
  aLoop : TFhirObservationReliability;
begin
  result := [];
  for aLoop := low(TFhirObservationReliability) to high(TFhirObservationReliability) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirObservationRelationshiptypesListAsInteger(aSet : TFhirObservationRelationshiptypesList) : Integer;
var
  a : TFhirObservationRelationshiptypes;
begin
  result := 0;
  for a := low(TFhirObservationRelationshiptypes) to high(TFhirObservationRelationshiptypes) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirObservationRelationshiptypesList(i : Integer) : TFhirObservationRelationshiptypesList;
var
  aLoop : TFhirObservationRelationshiptypes;
begin
  result := [];
  for aLoop := low(TFhirObservationRelationshiptypes) to high(TFhirObservationRelationshiptypes) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirOperationKindListAsInteger(aSet : TFhirOperationKindList) : Integer;
var
  a : TFhirOperationKind;
begin
  result := 0;
  for a := low(TFhirOperationKind) to high(TFhirOperationKind) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirOperationKindList(i : Integer) : TFhirOperationKindList;
var
  aLoop : TFhirOperationKind;
begin
  result := [];
  for aLoop := low(TFhirOperationKind) to high(TFhirOperationKind) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirOperationParameterUseListAsInteger(aSet : TFhirOperationParameterUseList) : Integer;
var
  a : TFhirOperationParameterUse;
begin
  result := 0;
  for a := low(TFhirOperationParameterUse) to high(TFhirOperationParameterUse) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirOperationParameterUseList(i : Integer) : TFhirOperationParameterUseList;
var
  aLoop : TFhirOperationParameterUse;
begin
  result := [];
  for aLoop := low(TFhirOperationParameterUse) to high(TFhirOperationParameterUse) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirIssueSeverityListAsInteger(aSet : TFhirIssueSeverityList) : Integer;
var
  a : TFhirIssueSeverity;
begin
  result := 0;
  for a := low(TFhirIssueSeverity) to high(TFhirIssueSeverity) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirIssueSeverityList(i : Integer) : TFhirIssueSeverityList;
var
  aLoop : TFhirIssueSeverity;
begin
  result := [];
  for aLoop := low(TFhirIssueSeverity) to high(TFhirIssueSeverity) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirOrderOutcomeCodeListAsInteger(aSet : TFhirOrderOutcomeCodeList) : Integer;
var
  a : TFhirOrderOutcomeCode;
begin
  result := 0;
  for a := low(TFhirOrderOutcomeCode) to high(TFhirOrderOutcomeCode) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirOrderOutcomeCodeList(i : Integer) : TFhirOrderOutcomeCodeList;
var
  aLoop : TFhirOrderOutcomeCode;
begin
  result := [];
  for aLoop := low(TFhirOrderOutcomeCode) to high(TFhirOrderOutcomeCode) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirAdministrativeGenderListAsInteger(aSet : TFhirAdministrativeGenderList) : Integer;
var
  a : TFhirAdministrativeGender;
begin
  result := 0;
  for a := low(TFhirAdministrativeGender) to high(TFhirAdministrativeGender) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAdministrativeGenderList(i : Integer) : TFhirAdministrativeGenderList;
var
  aLoop : TFhirAdministrativeGender;
begin
  result := [];
  for aLoop := low(TFhirAdministrativeGender) to high(TFhirAdministrativeGender) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirLinkTypeListAsInteger(aSet : TFhirLinkTypeList) : Integer;
var
  a : TFhirLinkType;
begin
  result := 0;
  for a := low(TFhirLinkType) to high(TFhirLinkType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirLinkTypeList(i : Integer) : TFhirLinkTypeList;
var
  aLoop : TFhirLinkType;
begin
  result := [];
  for aLoop := low(TFhirLinkType) to high(TFhirLinkType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirIdentityAssuranceLevelListAsInteger(aSet : TFhirIdentityAssuranceLevelList) : Integer;
var
  a : TFhirIdentityAssuranceLevel;
begin
  result := 0;
  for a := low(TFhirIdentityAssuranceLevel) to high(TFhirIdentityAssuranceLevel) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirIdentityAssuranceLevelList(i : Integer) : TFhirIdentityAssuranceLevelList;
var
  aLoop : TFhirIdentityAssuranceLevel;
begin
  result := [];
  for aLoop := low(TFhirIdentityAssuranceLevel) to high(TFhirIdentityAssuranceLevel) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirProcedureRelationshipTypeListAsInteger(aSet : TFhirProcedureRelationshipTypeList) : Integer;
var
  a : TFhirProcedureRelationshipType;
begin
  result := 0;
  for a := low(TFhirProcedureRelationshipType) to high(TFhirProcedureRelationshipType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirProcedureRelationshipTypeList(i : Integer) : TFhirProcedureRelationshipTypeList;
var
  aLoop : TFhirProcedureRelationshipType;
begin
  result := [];
  for aLoop := low(TFhirProcedureRelationshipType) to high(TFhirProcedureRelationshipType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirProcedureRequestStatusListAsInteger(aSet : TFhirProcedureRequestStatusList) : Integer;
var
  a : TFhirProcedureRequestStatus;
begin
  result := 0;
  for a := low(TFhirProcedureRequestStatus) to high(TFhirProcedureRequestStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirProcedureRequestStatusList(i : Integer) : TFhirProcedureRequestStatusList;
var
  aLoop : TFhirProcedureRequestStatus;
begin
  result := [];
  for aLoop := low(TFhirProcedureRequestStatus) to high(TFhirProcedureRequestStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirProcedureRequestPriorityListAsInteger(aSet : TFhirProcedureRequestPriorityList) : Integer;
var
  a : TFhirProcedureRequestPriority;
begin
  result := 0;
  for a := low(TFhirProcedureRequestPriority) to high(TFhirProcedureRequestPriority) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirProcedureRequestPriorityList(i : Integer) : TFhirProcedureRequestPriorityList;
var
  aLoop : TFhirProcedureRequestPriority;
begin
  result := [];
  for aLoop := low(TFhirProcedureRequestPriority) to high(TFhirProcedureRequestPriority) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirProvenanceEntityRoleListAsInteger(aSet : TFhirProvenanceEntityRoleList) : Integer;
var
  a : TFhirProvenanceEntityRole;
begin
  result := 0;
  for a := low(TFhirProvenanceEntityRole) to high(TFhirProvenanceEntityRole) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirProvenanceEntityRoleList(i : Integer) : TFhirProvenanceEntityRoleList;
var
  aLoop : TFhirProvenanceEntityRole;
begin
  result := [];
  for aLoop := low(TFhirProvenanceEntityRole) to high(TFhirProvenanceEntityRole) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirQuestionnaireStatusListAsInteger(aSet : TFhirQuestionnaireStatusList) : Integer;
var
  a : TFhirQuestionnaireStatus;
begin
  result := 0;
  for a := low(TFhirQuestionnaireStatus) to high(TFhirQuestionnaireStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirQuestionnaireStatusList(i : Integer) : TFhirQuestionnaireStatusList;
var
  aLoop : TFhirQuestionnaireStatus;
begin
  result := [];
  for aLoop := low(TFhirQuestionnaireStatus) to high(TFhirQuestionnaireStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirAnswerFormatListAsInteger(aSet : TFhirAnswerFormatList) : Integer;
var
  a : TFhirAnswerFormat;
begin
  result := 0;
  for a := low(TFhirAnswerFormat) to high(TFhirAnswerFormat) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirAnswerFormatList(i : Integer) : TFhirAnswerFormatList;
var
  aLoop : TFhirAnswerFormat;
begin
  result := [];
  for aLoop := low(TFhirAnswerFormat) to high(TFhirAnswerFormat) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirQuestionnaireAnswersStatusListAsInteger(aSet : TFhirQuestionnaireAnswersStatusList) : Integer;
var
  a : TFhirQuestionnaireAnswersStatus;
begin
  result := 0;
  for a := low(TFhirQuestionnaireAnswersStatus) to high(TFhirQuestionnaireAnswersStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirQuestionnaireAnswersStatusList(i : Integer) : TFhirQuestionnaireAnswersStatusList;
var
  aLoop : TFhirQuestionnaireAnswersStatus;
begin
  result := [];
  for aLoop := low(TFhirQuestionnaireAnswersStatus) to high(TFhirQuestionnaireAnswersStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirReferralstatusListAsInteger(aSet : TFhirReferralstatusList) : Integer;
var
  a : TFhirReferralstatus;
begin
  result := 0;
  for a := low(TFhirReferralstatus) to high(TFhirReferralstatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirReferralstatusList(i : Integer) : TFhirReferralstatusList;
var
  aLoop : TFhirReferralstatus;
begin
  result := [];
  for aLoop := low(TFhirReferralstatus) to high(TFhirReferralstatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirSecurityEventActionListAsInteger(aSet : TFhirSecurityEventActionList) : Integer;
var
  a : TFhirSecurityEventAction;
begin
  result := 0;
  for a := low(TFhirSecurityEventAction) to high(TFhirSecurityEventAction) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirSecurityEventActionList(i : Integer) : TFhirSecurityEventActionList;
var
  aLoop : TFhirSecurityEventAction;
begin
  result := [];
  for aLoop := low(TFhirSecurityEventAction) to high(TFhirSecurityEventAction) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirSecurityEventOutcomeListAsInteger(aSet : TFhirSecurityEventOutcomeList) : Integer;
var
  a : TFhirSecurityEventOutcome;
begin
  result := 0;
  for a := low(TFhirSecurityEventOutcome) to high(TFhirSecurityEventOutcome) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirSecurityEventOutcomeList(i : Integer) : TFhirSecurityEventOutcomeList;
var
  aLoop : TFhirSecurityEventOutcome;
begin
  result := [];
  for aLoop := low(TFhirSecurityEventOutcome) to high(TFhirSecurityEventOutcome) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirNetworkTypeListAsInteger(aSet : TFhirNetworkTypeList) : Integer;
var
  a : TFhirNetworkType;
begin
  result := 0;
  for a := low(TFhirNetworkType) to high(TFhirNetworkType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirNetworkTypeList(i : Integer) : TFhirNetworkTypeList;
var
  aLoop : TFhirNetworkType;
begin
  result := [];
  for aLoop := low(TFhirNetworkType) to high(TFhirNetworkType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirObjectTypeListAsInteger(aSet : TFhirObjectTypeList) : Integer;
var
  a : TFhirObjectType;
begin
  result := 0;
  for a := low(TFhirObjectType) to high(TFhirObjectType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirObjectTypeList(i : Integer) : TFhirObjectTypeList;
var
  aLoop : TFhirObjectType;
begin
  result := [];
  for aLoop := low(TFhirObjectType) to high(TFhirObjectType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirObjectRoleListAsInteger(aSet : TFhirObjectRoleList) : Integer;
var
  a : TFhirObjectRole;
begin
  result := 0;
  for a := low(TFhirObjectRole) to high(TFhirObjectRole) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirObjectRoleList(i : Integer) : TFhirObjectRoleList;
var
  aLoop : TFhirObjectRole;
begin
  result := [];
  for aLoop := low(TFhirObjectRole) to high(TFhirObjectRole) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirObjectLifecycleListAsInteger(aSet : TFhirObjectLifecycleList) : Integer;
var
  a : TFhirObjectLifecycle;
begin
  result := 0;
  for a := low(TFhirObjectLifecycle) to high(TFhirObjectLifecycle) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirObjectLifecycleList(i : Integer) : TFhirObjectLifecycleList;
var
  aLoop : TFhirObjectLifecycle;
begin
  result := [];
  for aLoop := low(TFhirObjectLifecycle) to high(TFhirObjectLifecycle) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirSlotstatusListAsInteger(aSet : TFhirSlotstatusList) : Integer;
var
  a : TFhirSlotstatus;
begin
  result := 0;
  for a := low(TFhirSlotstatus) to high(TFhirSlotstatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirSlotstatusList(i : Integer) : TFhirSlotstatusList;
var
  aLoop : TFhirSlotstatus;
begin
  result := [];
  for aLoop := low(TFhirSlotstatus) to high(TFhirSlotstatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirHierarchicalRelationshipTypeListAsInteger(aSet : TFhirHierarchicalRelationshipTypeList) : Integer;
var
  a : TFhirHierarchicalRelationshipType;
begin
  result := 0;
  for a := low(TFhirHierarchicalRelationshipType) to high(TFhirHierarchicalRelationshipType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirHierarchicalRelationshipTypeList(i : Integer) : TFhirHierarchicalRelationshipTypeList;
var
  aLoop : TFhirHierarchicalRelationshipType;
begin
  result := [];
  for aLoop := low(TFhirHierarchicalRelationshipType) to high(TFhirHierarchicalRelationshipType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirSubscriptionStatusListAsInteger(aSet : TFhirSubscriptionStatusList) : Integer;
var
  a : TFhirSubscriptionStatus;
begin
  result := 0;
  for a := low(TFhirSubscriptionStatus) to high(TFhirSubscriptionStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirSubscriptionStatusList(i : Integer) : TFhirSubscriptionStatusList;
var
  aLoop : TFhirSubscriptionStatus;
begin
  result := [];
  for aLoop := low(TFhirSubscriptionStatus) to high(TFhirSubscriptionStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirSubscriptionChannelTypeListAsInteger(aSet : TFhirSubscriptionChannelTypeList) : Integer;
var
  a : TFhirSubscriptionChannelType;
begin
  result := 0;
  for a := low(TFhirSubscriptionChannelType) to high(TFhirSubscriptionChannelType) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirSubscriptionChannelTypeList(i : Integer) : TFhirSubscriptionChannelTypeList;
var
  aLoop : TFhirSubscriptionChannelType;
begin
  result := [];
  for aLoop := low(TFhirSubscriptionChannelType) to high(TFhirSubscriptionChannelType) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirValuesetSupplyStatusListAsInteger(aSet : TFhirValuesetSupplyStatusList) : Integer;
var
  a : TFhirValuesetSupplyStatus;
begin
  result := 0;
  for a := low(TFhirValuesetSupplyStatus) to high(TFhirValuesetSupplyStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirValuesetSupplyStatusList(i : Integer) : TFhirValuesetSupplyStatusList;
var
  aLoop : TFhirValuesetSupplyStatus;
begin
  result := [];
  for aLoop := low(TFhirValuesetSupplyStatus) to high(TFhirValuesetSupplyStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirValuesetSupplyDispenseStatusListAsInteger(aSet : TFhirValuesetSupplyDispenseStatusList) : Integer;
var
  a : TFhirValuesetSupplyDispenseStatus;
begin
  result := 0;
  for a := low(TFhirValuesetSupplyDispenseStatus) to high(TFhirValuesetSupplyDispenseStatus) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirValuesetSupplyDispenseStatusList(i : Integer) : TFhirValuesetSupplyDispenseStatusList;
var
  aLoop : TFhirValuesetSupplyDispenseStatus;
begin
  result := [];
  for aLoop := low(TFhirValuesetSupplyDispenseStatus) to high(TFhirValuesetSupplyDispenseStatus) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirFilterOperatorListAsInteger(aSet : TFhirFilterOperatorList) : Integer;
var
  a : TFhirFilterOperator;
begin
  result := 0;
  for a := low(TFhirFilterOperator) to high(TFhirFilterOperator) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirFilterOperatorList(i : Integer) : TFhirFilterOperatorList;
var
  aLoop : TFhirFilterOperator;
begin
  result := [];
  for aLoop := low(TFhirFilterOperator) to high(TFhirFilterOperator) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirEyeCodesListAsInteger(aSet : TFhirEyeCodesList) : Integer;
var
  a : TFhirEyeCodes;
begin
  result := 0;
  for a := low(TFhirEyeCodes) to high(TFhirEyeCodes) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirEyeCodesList(i : Integer) : TFhirEyeCodesList;
var
  aLoop : TFhirEyeCodes;
begin
  result := [];
  for aLoop := low(TFhirEyeCodes) to high(TFhirEyeCodes) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


function TFhirBaseCodesListAsInteger(aSet : TFhirBaseCodesList) : Integer;
var
  a : TFhirBaseCodes;
begin
  result := 0;
  for a := low(TFhirBaseCodes) to high(TFhirBaseCodes) do
  begin
    assert(ord(a) < 32);
    if a in aSet then
      result := result + 1 shl (ord(a));
  end;
end;

function IntegerAsTFhirBaseCodesList(i : Integer) : TFhirBaseCodesList;
var
  aLoop : TFhirBaseCodes;
begin
  result := [];
  for aLoop := low(TFhirBaseCodes) to high(TFhirBaseCodes) Do
  begin
    assert(ord(aLoop) < 32);
    if i and (1 shl (ord(aLoop))) > 0 Then
      result := result + [aLoop];
  end;
 end;


end.
