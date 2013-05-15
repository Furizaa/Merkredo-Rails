#@class ModalView
#@extends Ember.ContainerView
#@namespace Merkredo
#@module Merkredo
Merkredo.ModalView = Ember.ContainerView.extend

  attributeBindings: ['data-offset']
  'data-offset': 0

  childViews: ['modalHeaderView', 'modalBodyView']

  classNames: ['modal reveal-modal small']

  classNameBindings: ['controller.currentView.modalClass']

  elementId: 'merkredo-modal',

  modalHeaderView: Ember.View.create
    templateName: 'modal/modal_header'
    titleBinding: 'controller.currentView.title'

  modalBodyView: Ember.ContainerView.create
    currentViewBinding: 'controller.currentView'

  viewChanged: ( ->
    if view = @get 'controller.currentView'
      $('#modal-alert').hide()
      Em.run.next =>
        @$().foundation 'reveal', 'open'
  ).observes 'controller.currentView'
