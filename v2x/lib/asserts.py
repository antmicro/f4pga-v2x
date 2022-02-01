#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright 2020-2022 F4PGA Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0


def __safe_call(f, a):
    """Call a function and capture all exceptions."""
    try:
        return f(a)
    except Exception as e:
        return "{}@{}({})".format(a.__class__.__name__, id(a), e)


def __safe_error(msg, a, b):
    """Generate the error message for assert_XX without causing an error."""
    return "{} ({}) {} {} ({})".format(
        __safe_call(str, a),
        __safe_call(repr, a),
        msg,
        __safe_call(str, b),
        __safe_call(repr, b),
    )


def assert_eq(a, b, msg=None):
    """Assert equal with better error message."""
    assert a == b, msg or __safe_error("!=", a, b)


def assert_not_in(needle, haystack, msg=None):
    """Assert equal with better error message."""
    assert needle not in haystack, msg or __safe_error(
        "already in", needle, haystack)


def assert_is(a, b):
    """Assert is with better error message."""
    assert a is b, __safe_error("is not", a, b)


def assert_type(
        obj, cls, msg="{obj} ({obj!r}) should be a {cls}, not {objcls}"):
    """Raise a type error if obj is not an instance of cls."""
    if not isinstance(obj, cls):
        raise TypeError(msg.format(obj=obj, objcls=type(obj), cls=cls))


def assert_type_or_none(obj, classes):
    """Raise a type error if obj is not an instance of cls or None."""
    if obj is not None:
        assert_type(obj, classes)


def assert_len_eq(v):
    """Check all lists in a list are equal length"""
    # Sanity check
    max_len = max(len(p) for p in v)
    for i, p in enumerate(v):
        assert len(p) == max_len, "Length check failed!\n \
v[{}] has {} elements != {} ({!r})\n{!r}".format(i, len(p), max_len, p, v)
