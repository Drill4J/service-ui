/*
 * Copyright 2019 EPAM Systems
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import React from 'react';
import PropTypes from 'prop-types';
import classNames from 'classnames/bind';
import styles from './sharedFilterIconTooltip.scss';
import { messages } from '../messages';

const cx = classNames.bind(styles);

export const SharedFilterIconTooltip = ({ intl, currentUser, owner }) => (
  <div className={cx('share-tooltip')}>
    {currentUser === owner || owner === undefined
      ? intl.formatMessage(messages.sharedFilter)
      : intl.formatMessage(messages.sharedByFilter, { owner })}
  </div>
);
SharedFilterIconTooltip.propTypes = {
  intl: PropTypes.object.isRequired,
  currentUser: PropTypes.string,
  owner: PropTypes.string,
};

SharedFilterIconTooltip.defaultProps = {
  currentUser: '',
  owner: undefined,
};
