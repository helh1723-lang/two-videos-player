import assert from 'node:assert/strict';
import test from 'node:test';

import { getBaseTime, getTimelineDuration, getVideoTime } from '../timeline.js';

test('maps video time to shared base time with offsets', () => {
  assert.equal(getBaseTime(12, 2), 10);
  assert.equal(getBaseTime(2, 5), 0);
});

test('maps shared base time back to target video time', () => {
  assert.equal(getVideoTime(10, 2, 20), 12);
  assert.equal(getVideoTime(10, -4, 20), 6);
  assert.equal(getVideoTime(10, 15, 20), 20);
  assert.equal(getVideoTime(2, -5, 20), 0);
});

test('computes visible shared timeline duration from both videos', () => {
  assert.equal(getTimelineDuration({ video1: 100, video2: 80 }, { video1: 10, video2: -5 }), 90);
  assert.equal(getTimelineDuration({ video1: 5, video2: 8 }, { video1: 10, video2: 12 }), 0);
});
