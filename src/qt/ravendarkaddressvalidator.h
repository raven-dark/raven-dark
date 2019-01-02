// Copyright (c) 2011-2014 The Bitcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef RAVENDARK_QT_RAVENDARKADDRESSVALIDATOR_H
#define RAVENDARK_QT_RAVENDARKADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class RavenDarkAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit RavenDarkAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** RavenDark address widget validator, checks for a valid ravendark address.
 */
class RavenDarkAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit RavenDarkAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // RAVENDARK_QT_RAVENDARKADDRESSVALIDATOR_H
