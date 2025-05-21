@extends('layouts.app')
@section('page-title')
    {{__('Notice Board')}}
@endsection
@section('breadcrumb')
    <ul class="breadcrumb mb-0">
        <li class="breadcrumb-item">
            <a href="{{route('dashboard')}}"><h1>{{__('Dashboard')}}</h1></a>
        </li>
        <li class="breadcrumb-item active">
            <a href="#">{{__('Notice Board')}}</a>
        </li>
    </ul>
@endsection
@section('card-action-btn')
    @if(Gate::check('create note') || \Auth::user()->type=='super admin')
        <a class="btn btn-primary btn-sm ml-20 customModal" href="#" data-size="md"
           data-url="{{ route('note.create') }}"
           data-title="{{__('Create New Note')}}"> <i class="ti-plus mr-5"></i>{{__('Create Note')}}</a>
    @endif
@endsection
@section('content')
    <div class="row">
        <div class="col-12">
            <div class="row">
                @foreach ($notes as $note)
                    <div class="col-xl-4 col-md-6 cdx-xxl-50 cdx-xl-50">
                        <div class="card contact-card">
                            <div class="card-body">
                                <div class="media align-items-center">
                                    <div class="media-body">
                                        <h4>{{ $note->title }}</h4>
                                    </div>
                                    @if (Gate::check('edit note') || Gate::check('delete note'))
                                        <div class="user-setting">
                                            <div class="action-menu">
                                                <div class="action-toggle"><i data-feather="more-vertical"></i></div>
                                                <ul class="action-dropdown">
                                                    {!! Form::open(['method' => 'DELETE', 'route' => ['note.destroy', $note->id]]) !!}
                                                    @if (Gate::check('edit note'))
                                                        <li><a class="modal-toggle customModal" href="javascript:void(0);"
                                                                data-bs-toggle="tooltip" data-title="{{ __('Edit Note') }}"
                                                                data-bs-toggle="modal"
                                                                data-url="{{ route('note.edit', $note->id) }}"
                                                                data-bs-target="#contactmodal"> <i data-feather="edit">
                                                                </i>{{ __('Edit') }}</a>
                                                        </li>
                                                    @endif
                                                    @if (Gate::check('delete note'))
                                                        <li>
                                                            <a class="confirm_dialog" href="#">
                                                                <i data-feather="trash"></i>
                                                                {{ __('Delete') }}
                                                            </a>
                                                        </li>
                                                    @endif
                                                    {!! Form::close() !!}
                                                </ul>
                                            </div>
                                        </div>
                                    @endif
                                </div>
                                <div class="user-detail">
                                    <h5 class="text-primary mb-10"> <i class="fa fa-info-circle mr-10"></i>{{ __('Description') }}
                                    </h5>
                                    <p class="text-light">{{ $note->description }}</p>
                                    <ul class="info-list">
                                        <li>
                                            <span>{{ __('create date') }} :- </span> {{ dateFormat($note->created_at) }}
                                        </li>
                                        <li><span>{{ __('attachment') }} :-</span>
                                            @if (!empty($note->attachment))
                                                <a href="{{ asset('/storage/upload/applicant/attachment/' . $note->attachment) }}"
                                                    download="download">
                                                    <i class="ti-download"></i></a>
                                            @else
                                                -
                                            @endif
                                        </li>

                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
@endsection
